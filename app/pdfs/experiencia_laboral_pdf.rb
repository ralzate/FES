=begin
	
NO usar (draw text)!! este metodo no se acomoda a los otros
(Text) siiiii :)
	
=end
class ExperienciaLaboralPdf < Prawn::Document
	def initialize(experiencias_laborales,estudios_complementarios,
		informaciones_academicas,referencias_personales,users ,view_context)
	    super()
	    @experiencias_laborales = experiencias_laborales
   	    @estudios_complementarios = estudios_complementarios
   	    @informaciones_academicas = informaciones_academicas
   	    @referencias_personales = referencias_personales
   	    @users = users
		datos_servidual
	    logo_1
	    titulo_2
	    datos_personales_3
	    datos_usuario_4
	   	experiencias_laborales_5
	    estudios_complementarios_6
	    informaciones_academicas_7
	    referencias_personales_8
	end


	def datos_servidual	

		move_down -15
		y_position = cursor - 1
			bounding_box([20, y_position], :width => 280, :height => 10) do
			transparent(0.0) { stroke_bounds }
			text "www.servidual.com", size: 9, :font => "Courier", style: :bold

		end

		y_position = cursor - 4
			bounding_box([10, y_position], :width => 280, :height => 10) do
			transparent(0.0) { stroke_bounds }
			text "servidual@servidual.com", size: 9, :font => "Courier", style: :bold
		end

		y_position = cursor - 4
			bounding_box([25, y_position], :width => 280, :height => 10) do
			transparent(0.0) { stroke_bounds }
			text "(+574) 4440996", size: 9, style: :bold
		end

		y_position = cursor - 4
			bounding_box([24, y_position], :width => 280, :height => 10) do
			transparent(0.0) { stroke_bounds }
			text "Cra 80# 44B-149", size: 9, :font => "Courier", style: :bold
		end

		y_position = cursor - 4
			bounding_box([18, y_position], :width => 280, :height => 250) do
			transparent(0.0) { stroke_bounds }
			text "La America-Medellin",  size: 9, :font => "Courier", style: :bold
		end
			
			
	end

	def logo_1
	    # This inserts an image in the pdf file and sets the size of the image
	    image "#{Rails.root}/app/assets/images/logo/logo.png", :at => [180, 738], :width => 135, :height => 70
 		t = Time.now
 	  	#draw_text  formatted = "#{t.strftime("%d-%m-%Y")}", :at => [450, 616], size: 10, style: :bold 
	end

	def titulo_2
		#move_down 20
	    #text "Mi Curriculum", size: 28, style: :bold_italic
	end


	def datos_personales_3
		#move_down 20
	    #text "Datos Personales", size: 28, style: :bold
	end

	def datos_usuario_4
	  	move_down -180
	  	text "Mis Datos Personales", size: 15, style: :bold, :font => "Courier", :align => :center
	  	#text "Mis Experiencias Laborales", size: 25, style: :bold
	  	table(users_rows, :column_widths => [125, 125, 125, 125], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold

		end
		move_down 10



		table(users_rows2, :column_widths => [125, 125, 125, 125], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold
					  	

		end
		move_down 10
		table(perfil_rows, :column_widths => [125, 160, 215], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold

		end
		canvas do
			fill_circle [bounds.left, bounds.top], 15
			fill_circle [bounds.right, bounds.top], 15
			fill_circle [bounds.right, bounds.bottom], 15
			fill_circle [bounds.left, bounds.bottom], 15
			
		end
	end

  	def users_rows
    	[['Nombres', 'Apellidos', 'Cedula', 'Direccion']] +
      		@users.map do |user|
      	[user.nombre1.capitalize + ' ' + user.nombre2.capitalize, 
      	user.apellido1.capitalize + ' ' + user.apellido2.capitalize,
      		user.cedula,  user.direccion]
    	end
	end

	def users_rows2
    	[['Celular', 'Telefono', 'Profesion', 'Estado Civil']] +
      		@users.map do |user|
      	[ user.celular, user.telefono, user.profesion, user.estado_civil]
    	end
	end

	def perfil_rows
		[['Fecha Nacimiento','Email', 'Perfil']] +
			@users.map do |user|
		[user.fecha_nacimiento, user.email, user.perfil]
		end
	end

	def experiencias_laborales_5
	  	move_down 60
	  	text "Mis Experiencias Laborales", size: 15, style: :bold_italic, :font => "Courier", :align => :center
		table(experiencias_laborales_rows, :column_widths => [20, 90, 90, 90, 90, 120], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold
			row(0).borders = [:top, :bottom]	
		end
		canvas do
			fill_circle [bounds.left, bounds.top], 15
			fill_circle [bounds.right, bounds.top], 15
			fill_circle [bounds.right, bounds.bottom], 15
			fill_circle [bounds.left, bounds.bottom], 15
			
		end
	end

  	def experiencias_laborales_rows
    	[['#', 'Empresa', 'Cargo', 'Telefono', 'Fecha Inicio', 'Fecha Terminación']] +
      		@experiencias_laborales.map do |experiencia_laboral|
      	[experiencia_laboral.id, experiencia_laboral.empresa, 
      	experiencia_laboral.cargo, experiencia_laboral.telefono,
      	experiencia_laboral.fecha_inicio, experiencia_laboral.fecha_terminacion]
    	end
	end

	def estudios_complementarios_6
	  	move_down 50
	  	text "Estudios Complementarios", size: 15, style: :bold_italic, :font => "Courier", :align => :center

		table(estudios_complementarios_rows, :column_widths => [20, 160, 160, 160], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold
			row(0).borders = [:top, :bottom]	
		end
		canvas do
			fill_circle [bounds.left, bounds.top], 15
			fill_circle [bounds.right, bounds.top], 15
			fill_circle [bounds.right, bounds.bottom], 15
			fill_circle [bounds.left, bounds.bottom], 15
			
		end
	end

  	def estudios_complementarios_rows
    	[['#', 'Nombre', 'Entidad', 'Fecha Terminación']] +
      		@estudios_complementarios.map do |estudio_complementario|
      	[estudio_complementario.id, estudio_complementario.nombre, 
      	estudio_complementario.entidad, estudio_complementario.fecha_terminacion]
    	end
	end

	def informaciones_academicas_7
	  	move_down 50
	  	text "Informaciones Academicas", size: 15, style: :bold_italic, :font => "Courier", :align => :center
		table(informaciones_academicas_rows, :column_widths => [20, 120, 120, 120, 120], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold
			row(0).borders = [:top, :bottom]	
		end
		canvas do
			fill_circle [bounds.left, bounds.top], 15
			fill_circle [bounds.right, bounds.top], 15
			fill_circle [bounds.right, bounds.bottom], 15
			fill_circle [bounds.left, bounds.bottom], 15
			
		end
	end

  	def informaciones_academicas_rows
      	[['#', 'Tipo', 'Nombre', 'Fecha Terminación', 'Titulo Obtenido']] +
      		@informaciones_academicas.map do |informacion_academica|
      	[informacion_academica.id, informacion_academica.tipo_de_dato, 
      	informacion_academica.nombre, informacion_academica.fecha_terminacion,
      	informacion_academica.titulo_obtenido]
    	end
	end

	def referencias_personales_8
		move_down 50
		text "Referencias Personales", size: 16, style: :bold_italic, :font => "Courier",  :align => :center
		table(referencias_personales_rows, :column_widths => [20, 160, 160, 160], :cell_style => {
		  	position: :absulte,  
		  	size: 10,
		    :font => "Courier", :borders => []}) do
			row(0).font_style = :bold
			row(0).borders = [:top, :bottom]	
		end
		canvas do
			fill_circle [bounds.left, bounds.top], 15
			fill_circle [bounds.right, bounds.top], 15
			fill_circle [bounds.right, bounds.bottom], 15
			fill_circle [bounds.left, bounds.bottom], 15
			
		end
	end

  	def referencias_personales_rows
  		[['#', 'Nombre', 'Telefono', 'Profesion']] +
      		@referencias_personales.map do |referencias_personale|
      	[referencias_personale.id, referencias_personale.nombre, 
      	referencias_personale.telefono, referencias_personale.profesion]
    	end
	end

end