.class final Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
.super Ljava/lang/Object;
.source "BitmapIndexImpl.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CompressedBitmapBuilder"
.end annotation


# instance fields
.field private bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)V
    .locals 2
    .parameter

    .prologue
    .line 200
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 200
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)V

    return-void
.end method

.method static synthetic access$2000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->getBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    move-result-object v0

    return-object v0
.end method

.method private getBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    return-object v0
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z
    .locals 4
    .parameter "objectId"
    .parameter "type"

    .prologue
    const/4 v2, 0x0

    .line 204
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->addObject(Lorg/eclipse/jgit/lib/AnyObjectId;I)I
    invoke-static {v3, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$400(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/AnyObjectId;I)I

    move-result v1

    .line 205
    .local v1, position:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->contains(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 215
    :goto_0
    return v2

    .line 208
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    .line 209
    .local v0, entry:Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    if-eqz v0, :cond_1

    .line 210
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    goto :goto_0

    .line 214
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->set(I)V

    .line 215
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    .locals 3
    .parameter "other"

    .prologue
    .line 242
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmap(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 243
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    .end local p1
    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->access$700(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 250
    :goto_0
    return-object p0

    .line 244
    .restart local p1
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmapBuilder(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 245
    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    .line 246
    .local v0, b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_0

    .line 248
    .end local v0           #b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method public bridge synthetic andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    .locals 4

    .prologue
    .line 267
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    return-object v0
.end method

.method public bridge synthetic build()Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1

    .prologue
    .line 200
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->build()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public cardinality()I
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->cardinality()I

    move-result v0

    return v0
.end method

.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 2
    .parameter "objectId"

    .prologue
    .line 219
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$500(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 220
    .local v0, position:I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->contains(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/lib/BitmapObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 271
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->build()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    .locals 3
    .parameter "other"

    .prologue
    .line 230
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmap(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 231
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    .end local p1
    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->access$700(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 238
    :goto_0
    return-object p0

    .line 232
    .restart local p1
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmapBuilder(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 233
    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    .line 234
    .local v0, b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_0

    .line 236
    .end local v0           #b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method public bridge synthetic or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 2
    .parameter "objectId"

    .prologue
    .line 224
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$500(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 225
    .local v0, position:I
    if-ltz v0, :cond_0

    .line 226
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->remove(I)V

    .line 227
    :cond_0
    return-void
.end method

.method public removeAllOrNone(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)Z
    .locals 5
    .parameter "index"

    .prologue
    const/4 v2, 0x0

    .line 279
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$900(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 289
    :cond_0
    :goto_0
    return v2

    .line 282
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)I

    move-result v4

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->ones(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1100(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 285
    .local v0, curr:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v1

    .line 286
    .local v1, ii:Lcom/googlecode/javaewah/IntIterator;
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v3

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)I

    move-result v4

    if-lt v3, v4, :cond_0

    .line 288
    :cond_2
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    .line 289
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    .locals 3
    .parameter "other"

    .prologue
    .line 254
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmap(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 255
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    .end local p1
    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->access$700(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 262
    :goto_0
    return-object p0

    .line 256
    .restart local p1
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmapBuilder(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 257
    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    .line 258
    .local v0, b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->bitset:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->combine()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_0

    .line 260
    .end local v0           #b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method public bridge synthetic xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method
