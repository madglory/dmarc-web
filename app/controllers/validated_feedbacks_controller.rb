class ValidatedFeedbacksController < ApplicationController

  # GET /validated_feedbacks/1
  # GET /validated_feedbacks/1.json
  def show
    @validated_feedback = ValidatedFeedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @validated_feedback }
    end
  end

  # GET /validated_feedbacks/new
  # GET /validated_feedbacks/new.json
  def new

  end

  # POST /validated_feedbacks
  # POST /validated_feedbacks.json
  def create
    uploaded_io = params[:feedback]
    filename = uploaded_io.original_filename

    # Load required files
    original_doc   = Nokogiri::XML(uploaded_io.read)
    xsd   = Nokogiri::XML::Schema(File.read('lib/rua_patched_current.xsd'))
    xslt  = Nokogiri::XSLT(File.read('lib/provider_report_patches_current.xslt'))

    # Check if root element has proper namespace
    # errors << "Some error" if Nokogiri::Find feedback element

    # Perform transform
    transformed_doc = xslt.transform(original_doc)

    # Validate file
    results = [] + xsd.validate(transformed_doc)

    content = transformed_doc.to_xml

    @validated_feedback = ValidatedFeedback.new(:results => results, :content => content, :filename => filename)

    respond_to do |format|
      if @validated_feedback.save
        format.html { redirect_to @validated_feedback, notice: 'Validated feedback was successfully created.' }
        format.json { render json: @validated_feedback, status: :created, location: @validated_feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @validated_feedback.errors, status: :unprocessable_entity }
      end
    end

  end

end
