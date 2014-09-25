.class Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;
.super Ljava/lang/Object;
.source "SwipeListViewTouchListener.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PendingDismissData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;",
        ">;"
    }
.end annotation


# instance fields
.field public position:I

.field final synthetic this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

.field public view:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ILandroid/view/View;)V
    .locals 0
    .parameter
    .parameter "position"
    .parameter "view"

    .prologue
    .line 1000
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->this$0:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1001
    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->position:I

    .line 1002
    iput-object p3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    .line 1003
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;)I
    .locals 2
    .parameter "other"

    .prologue
    .line 1008
    iget v0, p1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->position:I

    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 996
    check-cast p1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->compareTo(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;)I

    move-result v0

    return v0
.end method
