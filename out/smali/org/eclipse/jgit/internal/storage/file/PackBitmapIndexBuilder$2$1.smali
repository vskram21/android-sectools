.class Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;
.super Ljava/lang/Object;
.source "PackBitmapIndexBuilder.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->iterator()Ljava/util/Iterator;
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
        "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private index:I

.field final synthetic this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;)V
    .locals 1
    .parameter

    .prologue
    .line 255
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 256
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->access$200(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/util/BlockList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 259
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->index:I

    if-ltz v0, :cond_0

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
    .line 255
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->next()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;
    .locals 13

    .prologue
    .line 263
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 264
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 265
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->access$200(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/util/BlockList;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->index:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 266
    .local v11, item:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    const/4 v4, 0x0

    .line 267
    .local v4, bestXorOffset:I
    invoke-virtual {v11}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v3

    .line 271
    .local v3, bestBitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/4 v10, 0x1

    .local v10, i:I
    :goto_0
    const/16 v0, 0xa

    if-gt v10, v0, :cond_1

    .line 272
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->index:I

    add-int v8, v10, v0

    .line 273
    .local v8, curr:I
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->access$200(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/util/BlockList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v0

    if-lt v8, v0, :cond_2

    .line 286
    .end local v8           #curr:I
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->index:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->index:I

    .line 288
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->access$300(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v0

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;

    .line 289
    .local v9, entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;
    if-nez v9, :cond_4

    .line 290
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 276
    .end local v9           #entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;
    .restart local v8       #curr:I
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->access$200(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/util/BlockList;

    move-result-object v0

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 277
    .local v12, other:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    invoke-virtual {v12}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v11}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v7

    .line 280
    .local v7, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v7}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v0

    invoke-virtual {v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 282
    move-object v3, v7

    .line 283
    move v4, v10

    .line 271
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 291
    .end local v7           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v8           #curr:I
    .end local v12           #other:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    .restart local v9       #entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;
    :cond_4
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->namePosition:I
    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->access$400(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v11}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getFlags()I

    move-result v5

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;-><init>(JLcom/googlecode/javaewah/EWAHCompressedBitmap;IILorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;)V

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 296
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
