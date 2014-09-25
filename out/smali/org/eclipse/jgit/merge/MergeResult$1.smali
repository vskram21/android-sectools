.class Lorg/eclipse/jgit/merge/MergeResult$1;
.super Ljava/lang/Object;
.source "MergeResult.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/merge/MergeResult;->iterator()Ljava/util/Iterator;
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
        "Lorg/eclipse/jgit/merge/MergeChunk;",
        ">;"
    }
.end annotation


# instance fields
.field idx:I

.field final synthetic this$0:Lorg/eclipse/jgit/merge/MergeResult;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/merge/MergeResult;)V
    .locals 0
    .parameter

    .prologue
    .line 137
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult$1;,"Lorg/eclipse/jgit/merge/MergeResult.1;"
    iput-object p1, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->this$0:Lorg/eclipse/jgit/merge/MergeResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 141
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult$1;,"Lorg/eclipse/jgit/merge/MergeResult.1;"
    iget v0, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    iget-object v1, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->this$0:Lorg/eclipse/jgit/merge/MergeResult;

    #getter for: Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;
    invoke-static {v1}, Lorg/eclipse/jgit/merge/MergeResult;->access$000(Lorg/eclipse/jgit/merge/MergeResult;)Lorg/eclipse/jgit/util/IntList;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/IntList;->size()I

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
    .line 137
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult$1;,"Lorg/eclipse/jgit/merge/MergeResult.1;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/MergeResult$1;->next()Lorg/eclipse/jgit/merge/MergeChunk;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/merge/MergeChunk;
    .locals 8

    .prologue
    .line 145
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult$1;,"Lorg/eclipse/jgit/merge/MergeResult.1;"
    invoke-static {}, Lorg/eclipse/jgit/merge/MergeResult;->access$100()[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->this$0:Lorg/eclipse/jgit/merge/MergeResult;

    #getter for: Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;
    invoke-static {v5}, Lorg/eclipse/jgit/merge/MergeResult;->access$000(Lorg/eclipse/jgit/merge/MergeResult;)Lorg/eclipse/jgit/util/IntList;

    move-result-object v5

    iget v6, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v5

    aget-object v3, v4, v5

    .line 146
    .local v3, state:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
    iget-object v4, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->this$0:Lorg/eclipse/jgit/merge/MergeResult;

    #getter for: Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;
    invoke-static {v4}, Lorg/eclipse/jgit/merge/MergeResult;->access$000(Lorg/eclipse/jgit/merge/MergeResult;)Lorg/eclipse/jgit/util/IntList;

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v2

    .line 147
    .local v2, srcIdx:I
    iget-object v4, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->this$0:Lorg/eclipse/jgit/merge/MergeResult;

    #getter for: Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;
    invoke-static {v4}, Lorg/eclipse/jgit/merge/MergeResult;->access$000(Lorg/eclipse/jgit/merge/MergeResult;)Lorg/eclipse/jgit/util/IntList;

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    .line 148
    .local v0, begin:I
    iget-object v4, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->this$0:Lorg/eclipse/jgit/merge/MergeResult;

    #getter for: Lorg/eclipse/jgit/merge/MergeResult;->chunks:Lorg/eclipse/jgit/util/IntList;
    invoke-static {v4}, Lorg/eclipse/jgit/merge/MergeResult;->access$000(Lorg/eclipse/jgit/merge/MergeResult;)Lorg/eclipse/jgit/util/IntList;

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/eclipse/jgit/merge/MergeResult$1;->idx:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v1

    .line 149
    .local v1, end:I
    new-instance v4, Lorg/eclipse/jgit/merge/MergeChunk;

    invoke-direct {v4, v2, v0, v1, v3}, Lorg/eclipse/jgit/merge/MergeChunk;-><init>(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    return-object v4
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 153
    .local p0, this:Lorg/eclipse/jgit/merge/MergeResult$1;,"Lorg/eclipse/jgit/merge/MergeResult.1;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
