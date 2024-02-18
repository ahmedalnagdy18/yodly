const String reviewsQuery = r"""
query reviews($paginate:PaginatorInput,$filter:ReviewFilter){
  reviews(paginate:$paginate,filter:$filter){
    data{
      items{
        id
        name
        description
        
      }
    }
    code
    message
    success
  }
}
""";
