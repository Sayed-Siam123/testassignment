class Queries {
  String addPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            id
            name
            lastName
            age
          }
      }
    """;
  }

  String getHolidayListQuery(){
    return """ 
     {
        getPackages(
          pagination: {
            skip: 0
            limit: 8
          }
        )
        {
          statusCode
          message
          result {
            count
            packages {
              uid
              title
              startingPrice
              thumbnail
              amenities {
                title
                icon
              }
              discount {
                title
                amount
              }
              durationText
              loyaltyPointText
              description
            }
          }
        }
      }""";
  }

  String getHolidayListQueryWithPagination({skip,limit}){
    return """ 
     {
        getPackages(
          pagination: {
            skip: $skip
            limit: $limit
          }
        )
        {
          statusCode
          message
          result {
            count
            packages {
              uid
              title
              startingPrice
              thumbnail
              amenities {
                title
                icon
              }
              discount {
                title
                amount
              }
              durationText
              loyaltyPointText
              description
            }
          }
        }
      }""";
  }

  String loginQuery(){
    return """ 
     mutation {
        loginClient (
          auth: {
            email: "devteam@saimonglobal.com"
            deviceUuid: "7026a238-d078-48b5-862b-c3c7d21d8712"
          }
          password: "12345678"
        )
        {
          message
          statusCode
          result {
            token
            refreshToken
            expiresAt
          }
        }
      }
      """;
  }

  String createEmptyCart(){
    return """
      mutation{
        createEmptyCart
      }
    """;
  }


  String getAllCategoryItem({id}){
    return """ 
      {
        category(id: ${int.parse(id.toString())}) {
          products {
            total_count
            page_info {
              current_page
              page_size
            }
          }
          children_count
          children {
            id
            name
            image
            children {
              id
              name
              image
              children {
                id
                name
                image
                children {
                  id
                  image
                  name
                }
              }
            }
          }
        }
      }
    """;
  }

  String deletePerson(id){
    return """
      mutation{
        deletePerson(id: "$id"){
          id
        }
      } 
    """;
  }

  String editPerson(String id, String name, String lastName, int age){
    return """
      mutation{
          editPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            name
            lastName
          }
      }    
     """;
  }
}