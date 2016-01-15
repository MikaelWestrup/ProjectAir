myApp.factory("Audit", function($resource) {
  return $resource("/api/audits/:id", { id: "@id" },
    {
      'index':   { method: 'GET', isArray: true },
      'create':  { method: 'POST' },
      'show':    { method: 'GET', isArray: false },
      'update':  { method: 'PUT' },
      'destroy': { method: 'DELETE' }
    }
  );
});

myApp.factory("Chapter", function($resource) {
  return $resource("/api/chapters/:id", { id: "@id" },
    {
      'index':   { method: 'GET', isArray: true }
    }
  );
});

myApp.factory('db_data', ['$resource',
  function($resource){
    return {
      Companies: $resource('/api/companies/:id', {id: '@id'}),
      // audit_types: $resource('/api/audit-types/:id', {id: '@id'})
      audit_types: [
        {id: 1, name: "Type 1", sub_types: [{id: 1, name: "1 sub type 1"},{id: 2, name: "1 sub type 2"},{id: 3, name: "1 sub type 3"}]},
        {id: 2, name: "Type 2", sub_types: [{id: 4, name: "1 sub type 1"},{id: 7, name: "1 sub type 2"},{id: 10, name: "1 sub type 3"}]},
        {id: 3, name: "Type 3", sub_types: [{id: 5, name: "1 sub type 1"},{id: 8, name: "1 sub type 2"},{id: 11, name: "1 sub type 3"}]},
        {id: 4, name: "Type 4", sub_types: [{id: 6, name: "1 sub type 1"},{id: 9, name: "1 sub type 2"},{id: 12, name: "1 sub type 3"}]}
      ]
    };
  }
]);

