.class Lorg/eclipse/jgit/util/RefList$1;
.super Ljava/lang/Object;
.source "RefList.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/RefList;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private idx:I

.field final synthetic this$0:Lorg/eclipse/jgit/util/RefList;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/RefList;)V
    .locals 0
    .parameter

    .prologue
    .line 104
    .local p0, this:Lorg/eclipse/jgit/util/RefList$1;,"Lorg/eclipse/jgit/util/RefList.1;"
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefList$1;->this$0:Lorg/eclipse/jgit/util/RefList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 108
    .local p0, this:Lorg/eclipse/jgit/util/RefList$1;,"Lorg/eclipse/jgit/util/RefList.1;"
    iget v0, p0, Lorg/eclipse/jgit/util/RefList$1;->idx:I

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$1;->this$0:Lorg/eclipse/jgit/util/RefList;

    #getter for: Lorg/eclipse/jgit/util/RefList;->cnt:I
    invoke-static {v1}, Lorg/eclipse/jgit/util/RefList;->access$000(Lorg/eclipse/jgit/util/RefList;)I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 104
    .local p0, this:Lorg/eclipse/jgit/util/RefList$1;,"Lorg/eclipse/jgit/util/RefList.1;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefList$1;->next()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/lib/Ref;
    .locals 3

    .prologue
    .line 112
    .local p0, this:Lorg/eclipse/jgit/util/RefList$1;,"Lorg/eclipse/jgit/util/RefList.1;"
    iget v0, p0, Lorg/eclipse/jgit/util/RefList$1;->idx:I

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefList$1;->this$0:Lorg/eclipse/jgit/util/RefList;

    #getter for: Lorg/eclipse/jgit/util/RefList;->cnt:I
    invoke-static {v1}, Lorg/eclipse/jgit/util/RefList;->access$000(Lorg/eclipse/jgit/util/RefList;)I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 113
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefList$1;->this$0:Lorg/eclipse/jgit/util/RefList;

    #getter for: Lorg/eclipse/jgit/util/RefList;->list:[Lorg/eclipse/jgit/lib/Ref;
    invoke-static {v0}, Lorg/eclipse/jgit/util/RefList;->access$100(Lorg/eclipse/jgit/util/RefList;)[Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/util/RefList$1;->idx:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/util/RefList$1;->idx:I

    aget-object v0, v0, v1

    return-object v0

    .line 114
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 118
    .local p0, this:Lorg/eclipse/jgit/util/RefList$1;,"Lorg/eclipse/jgit/util/RefList.1;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
