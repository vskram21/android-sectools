.class Lcom/fortysevendeg/swipelistview/SwipeListView$1;
.super Landroid/database/DataSetObserver;
.source "SwipeListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListView;->setAdapter(Landroid/widget/ListAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListView;


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListView;)V
    .locals 0
    .parameter

    .prologue
    .line 296
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListView$1;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    .line 300
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    .line 301
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView$1;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onListChanged()V

    .line 302
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView$1;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListView;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->access$000(Lcom/fortysevendeg/swipelistview/SwipeListView;)Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-result-object v0

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetItems()V

    .line 303
    return-void
.end method
