import java.util.*;
public class StockList 
{
public static LinkedList<StockItem> stock
        = new LinkedList<StockItem>();


public StockList() {};


// Adds item to end of stock list
public void addItem(StockItem item) 
{
    StockList.stock.addLast(item);
}


// Removes item identified by productID from stock list
public void deleteItem(String itemID) 
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
}


// Updates price of existing item
public void updateItemPrice(String itemID, double price) 
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


// Updates quantity of existing item
public void updateItemQuantity(String itemID, int quantity) 
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


// Updates re-order level of existing item
public void updateReOrderLevel(String itemID, 
int reOrderLevel) 
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


@Override public String toString()
{
  return "" + stock;

}

// Returns formatted representation of the stock list
//  public String formatStockList()
// {…}


// Returns formatted representation of re-order list
// Items are on this list if quantity < reOrderLevel
//  public String formatReOrderList()
//  {…}

ListIterator listIterator() {
    throw new UnsupportedOperationException("Not yet implemented");
}



}
