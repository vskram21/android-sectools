.class Lorg/eclipse/jgit/notes/LeafBucket$1;
.super Ljava/lang/Object;
.source "LeafBucket.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/notes/LeafBucket;->iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;
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
        "Lorg/eclipse/jgit/notes/Note;",
        ">;"
    }
.end annotation


# instance fields
.field private idx:I

.field final synthetic this$0:Lorg/eclipse/jgit/notes/LeafBucket;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/notes/LeafBucket;)V
    .locals 0
    .parameter

    .prologue
    .line 121
    iput-object p1, p0, Lorg/eclipse/jgit/notes/LeafBucket$1;->this$0:Lorg/eclipse/jgit/notes/LeafBucket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 125
    iget v0, p0, Lorg/eclipse/jgit/notes/LeafBucket$1;->idx:I

    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket$1;->this$0:Lorg/eclipse/jgit/notes/LeafBucket;

    #getter for: Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I
    invoke-static {v1}, Lorg/eclipse/jgit/notes/LeafBucket;->access$000(Lorg/eclipse/jgit/notes/LeafBucket;)I

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
    .line 121
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/LeafBucket$1;->next()Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/notes/Note;
    .locals 3

    .prologue
    .line 129
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/LeafBucket$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket$1;->this$0:Lorg/eclipse/jgit/notes/LeafBucket;

    #getter for: Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;
    invoke-static {v0}, Lorg/eclipse/jgit/notes/LeafBucket;->access$100(Lorg/eclipse/jgit/notes/LeafBucket;)[Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket$1;->idx:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/notes/LeafBucket$1;->idx:I

    aget-object v0, v0, v1

    return-object v0

    .line 132
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 136
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
