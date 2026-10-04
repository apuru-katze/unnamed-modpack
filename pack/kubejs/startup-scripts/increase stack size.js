ItemEvents.modification(event => {
    event.modify('#c:potions', item => {
        item.maxStackSize = 16
    });
    event.modify('supplementaries:lumisene_bottle', item => {
        item.maxStackSize = 16
    });
})