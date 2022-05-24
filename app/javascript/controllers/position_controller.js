import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element,{
      group: 'shared',
      animation: 150,
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    let id = event.item.id
    let data = new FormData()    
    data.append("position", event.newIndex + 1)
    console.log(event.newIndex + 1 )
    var url = "/movies/:id/move".replace(":id", id)
    Rails.ajax({
      url: url,
      type: 'PATCH',
      data: data
      
    })
    
  }
}