myApp.factory('db_data', [function($resource){
  var object = {
    chapters: [
      {id: 1, name: "Chapter 1", paragraphs: [{id: 1, code: 'A', description: "This is a description of chapter paragraph."}, {id: 10, code: 'B', description: "This is a description of chapter paragraph."}]},
      {id: 2, name: "Chapter 2", paragraphs: [{id: 2, code: 'A', description: "This is a description of chapter paragraph."}, {id: 11, code: 'B', description: "This is a description of chapter paragraph."}]},
      {id: 3, name: "Chapter 3", paragraphs: [{id: 3, code: 'A', description: "This is a description of chapter paragraph."}]},
      {id: 4, name: "Chapter 4", paragraphs: [{id: 4, code: 'A', description: "This is a description of chapter paragraph."}, {id: 12, code: 'B', description: "This is a description of chapter paragraph."}]},
      {id: 5, name: "Chapter 5", paragraphs: [{id: 5, code: 'A', description: "This is a description of chapter paragraph."}]}
    ],
    audit_types: [
      {id: 1, name: "Type 1", sub_types: [{id: 1, name: "1 sub type 1"},{id: 2, name: "1 sub type 2"},{id: 3, name: "1 sub type 3"}]},
      {id: 2, name: "Type 2", sub_types: [{id: 4, name: "1 sub type 1"},{id: 7, name: "1 sub type 2"},{id: 10, name: "1 sub type 3"}]},
      {id: 3, name: "Type 3", sub_types: [{id: 5, name: "1 sub type 1"},{id: 8, name: "1 sub type 2"},{id: 11, name: "1 sub type 3"}]},
      {id: 4, name: "Type 4", sub_types: [{id: 6, name: "1 sub type 1"},{id: 9, name: "1 sub type 2"},{id: 12, name: "1 sub type 3"}]}
    ]
  };
  return object;
}]);