'use strict';

module.exports.hello = async event => {
  console.log('event', event);

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
