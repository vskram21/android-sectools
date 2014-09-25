.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$3;
.super Ljava/lang/Object;
.source "SwipeListViewTouchListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setBackView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;


# direct methods
.method constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V
    .locals 0
    .parameter

    .prologue
    .line 168
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$3;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 171
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$3;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;
    invoke-static {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-result-object v0

    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$3;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    #getter for: Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I
    invoke-static {v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->access$000(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onClickBackView(I)V

    .line 172
    return-void
.end method
