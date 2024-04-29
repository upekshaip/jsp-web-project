import java.util.*;
public class StockListInterface
{
private StockList stock = null;

public StockListInterface(StockList stock){}

public void doMenu()
{
    System.out.println("StockList Main Menu");
    System.out.println("*******************");
    System.out.println("1. Add an Item");
    System.out.println("2. Delete an Item");
    System.out.println("3. Update Item Price");
    System.out.println("4. Update Item Quantity");
    System.out.println("5. Update ReOrder Level");
    System.out.println("6. Print Stock List");
    System.out.println("7. Print ReOrder List");
    System.out.println("8. Exit");

    System.out.println("Select option [1-8] :>");
}



private void doAddItem(StockItem item) 
{
    StockList.stock.addLast(item);
}

private void doDeleteItem(String itemID)
{
    ListIterator itr = stock.listIterator();
while(itr.hasNext())
 {
            StockItem item = (StockItem)itr.next();
    if(item.getitemID().equals(itemID))
    {
                    itr.remove();
        break;
    }
    }





private void doUpdateItemPrice(String itemID, double price)
{
    ListIterator itr = stock.listIterator();
    while(itr.hasNext())
    {
        StockItem item = (StockItem)itr.next();
        if(item.getitemID().equals(itemID))
        {
            item.setprice(price);
            break;
        }
    }
}





private void doUpdateItemQuantity(String itemID, int quantity)
{
    ListIterator itr = stock.listIterator();
    while(itr.hasNext())
    {
        StockItem item = (StockItem)itr.next();
        if(item.getitemID().equals(itemID))
        {
            item.setquantity(quantity);
            break;
        }
    }
}

private void doUpdateReOrderLevel(String itemID, int reOrderLevel)
{
    ListIterator itr = stock.listIterator();
    while(itr.hasNext())
    {
        StockItem item = (StockItem)itr.next();
        if(item.getitemID().equals(itemID))
        {
            item.setreOrderLevel(reOrderLevel);
            break;
        }
    }
}

// Display contents of stock list
private void doPrintStockList() {}

// Display contents of re-order list
private void doPrintReorderLIst() {}
}
