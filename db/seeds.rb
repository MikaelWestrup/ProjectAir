ParagraphType.create([{name: "Regulation"}, {name: "AMC"}, {name: "GM"}])

Regulation.create([
  {organization: "Organization Test 1", name: "Regulation Test 1"},
  {organization: "Organization Test 2", name: "Regulation Test 2"}
])

Chapter.create([
  {name: "Name Test 1", ctype: "Ctype Test 1", annex: "Annex Test 1", code: "Chapter code Test 1", regulation_id: 1},
  {name: "Name Test 2", ctype: "Ctype Test 2", annex: "Annex Test 2", code: "Chapter code Test 2", regulation_id: 2}
])

number = ['A', 'B', 'C', 'D', 'E', 'F']

(1..2).each do |chapter|
  (1..3).each do |para|
    Paragraph.create(
      name: "para number test #{para}",
      number: number[para],
      description: "description test #{para}",
      up_to_including_amendment: "up to and including amendment test #{para}",
      paragraph_type_id: para, chapter_id: chapter
    )
  end
end

(1...3).each do |t|
  audit = AuditType.create(name: "Audit Type #{t}", is_parent: true, main_type_id: nil)
  (1...3).each do |st|
    audit.sub_types.build(name: "Sub Audit Type #{t}-#{st}").save
  end
end