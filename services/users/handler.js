'use strict';

module.exports.hello = async (event, context) => {
  console.log('event', JSON.stringify(event, null, 2));
  console.log('context', JSON.stringify(context, null, 2));

  return {
    statusCode: 200,
    body: JSON.stringify({
      users: [
        { id: 1, name: 'João' },
        { id: 2, name: 'Maria' },
      ],
    })
  };
};
