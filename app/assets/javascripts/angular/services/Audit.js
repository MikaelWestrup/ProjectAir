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

myApp.factory('api', ['$resource',
  function($resource){
    return {
      Companies: $resource('/api/companies/:id', {id: '@id'}),
      Locations: $resource('/api/locations/:id', {id: '@id'}),
      Employees: $resource('/api/employees/:id', {id: '@id'}),
      AuditeeEmployees: $resource('/api/employees/auditees/:id', {id: '@id'}),
      AuditTypes: $resource('/api/audit-types/:id', {id: '@id'}),
      Audit: $resource("/api/audits/:id", { id: "@id" },
        {
          'index':   { method: 'GET', isArray: true },
          'create':  { method: 'POST' },
          'show':    { method: 'GET', isArray: false },
          'update':  { method: 'PUT' },
          'destroy': { method: 'DELETE' }
        }
      )
    };
  }
]);

