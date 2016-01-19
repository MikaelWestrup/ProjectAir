# Initialize Attachments types
AttachmentType.create([{name: "AMC"}, {name: "GM"}])

# Dummy data for regulations table
regulation = Regulation.create(name: "Commission Regulation (EU) No 1321/2014 of 26 November", organization: "IASA")

# Dummy data for chapters table and its paragraphs
# first record
chapter = regulation.chapters.create(name: "145.A.35 Certifying staff and support staff", ctype: "Part-145", annex: "II")
  chapter.paragraphs.create(name: "145.A.35(a)", description: "In addition to the appropriate requirements of 145.A.30(g) and (h), the organisation shall ensure that certifying staff and support staff have an adequate understanding of the relevant aircraft and/or components to be maintained together......", up_to_including_amendment: "Commission Regulation (EU) 2015/1088")
  chapter.paragraphs.create(name: "145.A.35(b)", description: "Paragraph B More text anf so on Extra information", up_to_including_amendment: "Commission Regulation (EU) 2015/1088")

# second record
chapter = regulation.chapters.create(name: "145.A.36 Next Chapter with pilots", ctype: "Part-145", annex: "II")
  chapter.paragraphs.create(name: "145.A.36.(a)", description: "Pilots must have active license", up_to_including_amendment: "Commission Regulation (EU) 2015/1088")

# Dummy data for companies table and its departments
company = Company.create(name: "Glenn Air")
  departments = company.departments.create(name: "Part-M")

# Dummy data for employees table
departments.employees.create(name: "Glenn Glenn", address: "Glennroad 4", office_phone: "+46735235222", cell_phone: "+46735235222", email: "glenn@glennair.com", role: "Auditor", company_id: company.id)

# Dummy data for locations table
Location.create(name: "Location First", country: "Country", airport: "Airport", address: "Address", zipcode: "111111", town: "Town/City", additional_details: "Additional Details")
Location.create(name: "Arlanda SAS", country: "Sweden", airport: "Arlanda", address: "Märsta", zipcode: "99999", town: "Märsta")