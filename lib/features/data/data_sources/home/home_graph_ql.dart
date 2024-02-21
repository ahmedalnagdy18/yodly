const String reviewsQuery = r"""
query reviews($paginate:PaginatorInput,$filter:ReviewFilter){
  reviews(paginate:$paginate,filter:$filter){
    data{
      items{
        user{
          userName
        }
        id
        name
        description
        title
        country
        city
        attachments{
          attachmentType
          link
        }
      }
    }
    code
    message
    success
  }
}
""";
