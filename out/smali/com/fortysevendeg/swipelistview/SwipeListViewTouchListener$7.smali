.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;
.super Ljava/lang/Object;
.source "SwipeListViewTouchListener.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private isFirstItem:Z

.field private isLastItem:Z

.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V
    .locals 1
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 661
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 663
    iput-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isFirstItem:Z

    .line 664
    iput-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isLastItem:Z

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 7
    .parameter "view"
    .parameter "firstVisibleItem"
    .parameter "visibleItemCount"
    .parameter "totalItemCount"

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 690
    iget-boolean v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isFirstItem:Z

    if-eqz v5, :cond_3

    .line 691
    if-ne p2, v4, :cond_2

    move v3, v4

    .line 692
    .local v3, onSecondItemList:Z
    :goto_0
    if-eqz v3, :cond_0

    .line 693
    iput-boolean v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isFirstItem:Z

    .line 702
    .end local v3           #onSecondItemList:Z
    :cond_0
    :goto_1
    iget-boolean v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isLastItem:Z

    if-eqz v5, :cond_6

    .line 703
    add-int v5, p2, p3

    add-int/lit8 v6, p4, -0x1

    if-ne v5, v6, :cond_5

    move v0, v4

    .line 704
    .local v0, onBeforeLastItemList:Z
    :goto_2
    if-eqz v0, :cond_1

    .line 705
    iput-boolean v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isLastItem:Z

    .line 714
    .end local v0           #onBeforeLastItemList:Z
    :cond_1
    :goto_3
    return-void

    :cond_2
    move v3, v2

    .line 691
    goto :goto_0

    .line 696
    :cond_3
    if-nez p2, :cond_4

    move v1, v4

    .line 697
    .local v1, onFirstItemList:Z
    :goto_4
    if-eqz v1, :cond_0

    .line 698
    iput-boolean v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isFirstItem:Z

    .line 699
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v5}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v5

    invoke-virtual {v5}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onFirstListItem()V

    goto :goto_1

    .end local v1           #onFirstItemList:Z
    :cond_4
    move v1, v2

    .line 696
    goto :goto_4

    :cond_5
    move v0, v2

    .line 703
    goto :goto_2

    .line 708
    :cond_6
    add-int v5, p2, p3

    if-lt v5, p4, :cond_7

    move v2, v4

    .line 709
    .local v2, onLastItemList:Z
    :cond_7
    if-eqz v2, :cond_1

    .line 710
    iput-boolean v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->isLastItem:Z

    .line 711
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v4}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onLastListItem()V

    goto :goto_3
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 4
    .parameter "absListView"
    .parameter "scrollState"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 668
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    if-eq p2, v1, :cond_3

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setEnabled(Z)V

    .line 669
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeClosesAllItemsWhenListMoves:Z
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$500(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-ne p2, v1, :cond_0

    .line 670
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeOpenedItems()V

    .line 672
    :cond_0
    if-ne p2, v1, :cond_1

    .line 673
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #setter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->listViewMoving:Z
    invoke-static {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$602(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;Z)Z

    .line 674
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, v2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setEnabled(Z)V

    .line 676
    :cond_1
    const/4 v0, 0x2

    if-eq p2, v0, :cond_2

    if-eq p2, v1, :cond_2

    .line 677
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #setter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->listViewMoving:Z
    invoke-static {v0, v2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$602(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;Z)Z

    .line 678
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    const/4 v1, -0x1

    #setter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I
    invoke-static {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$002(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)I

    .line 679
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->resetScrolling()V

    .line 680
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7$1;

    invoke-direct {v1, p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7$1;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 686
    :cond_2
    return-void

    :cond_3
    move v0, v2

    .line 668
    goto :goto_0
.end method
