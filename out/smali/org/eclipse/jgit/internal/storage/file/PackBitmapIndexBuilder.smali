.class public Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;
.super Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;
.source "PackBitmapIndexBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;,
        Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;
    }
.end annotation


# static fields
.field private static final MAX_XOR_OFFSET_SEARCH:I = 0xa


# instance fields
.field private final blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final byAddOrder:Lorg/eclipse/jgit/util/BlockList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/BlockList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

.field private final commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, byName:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    new-instance v3, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v3}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;-><init>(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V

    .line 77
    new-instance v3, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v3}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;

    .line 79
    new-instance v3, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v3}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 91
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->sortByOffset(Ljava/util/List;)[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 93
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    array-length v3, v3

    div-int/lit8 v3, v3, 0x40

    const/4 v4, 0x4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 94
    .local v1, sizeInWords:I
    new-instance v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v3, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>(I)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 95
    new-instance v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v3, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>(I)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 96
    new-instance v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v3, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>(I)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 97
    new-instance v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v3, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>(I)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 98
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    array-length v3, v3

    if-ge v0, v3, :cond_0

    .line 99
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v2

    .line 100
    .local v2, type:I
    packed-switch v2, :pswitch_data_0

    .line 114
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->badObjectType:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 102
    :pswitch_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v3, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    .line 98
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    :pswitch_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v3, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    goto :goto_1

    .line 108
    :pswitch_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v3, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    goto :goto_1

    .line 111
    :pswitch_3
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v3, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    goto :goto_1

    .line 118
    .end local v2           #type:I
    :cond_0
    return-void

    .line 100
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/util/BlockList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;

    return-object v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    return-object v0
.end method

.method private sortByOffset(Ljava/util/List;)[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)[",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 122
    .local v1, result:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 123
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aput-object v2, v1, v0

    .line 124
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    new-instance v3, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;

    aget-object v4, v1, v0

    const/4 v5, 0x0

    invoke-direct {v3, v4, v0, v5}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;ILorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;)V

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 122
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 126
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 131
    const/4 v0, 0x0

    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 132
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;

    #setter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->offsetPosition:I
    invoke-static {v2, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->access$102(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;I)I

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 133
    :cond_1
    return-object v1
.end method


# virtual methods
.method public addBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V
    .locals 2
    .parameter "objectId"
    .parameter "bitmap"
    .parameter "flags"

    .prologue
    .line 171
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, p3}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;I)V

    .line 172
    .local v0, result:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 173
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 174
    return-void
.end method

.method public addBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;I)V
    .locals 3
    .parameter "objectId"
    .parameter "bitmap"
    .parameter "flags"

    .prologue
    .line 147
    instance-of v1, p2, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    if-eqz v1, :cond_0

    .line 148
    check-cast p2, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .end local p2
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->build()Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;

    move-result-object p2

    .line 151
    .restart local p2
    :cond_0
    instance-of v1, p2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    if-eqz v1, :cond_1

    .line 152
    check-cast p2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    .end local p2
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->getEwahCompressedBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 156
    .local v0, compressed:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {p0, p1, v0, p3}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->addBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 157
    return-void

    .line 154
    .end local v0           #compressed:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .restart local p2
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public clearBitmaps()V
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byAddOrder:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/BlockList;->clear()V

    .line 241
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->clear()V

    .line 242
    return-void
.end method

.method public findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 2
    .parameter "objectId"

    .prologue
    .line 194
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->positionEntries:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;

    .line 195
    .local v0, entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;
    if-nez v0, :cond_0

    .line 196
    const/4 v1, -0x1

    .line 197
    :goto_0
    return v1

    :cond_0
    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->offsetPosition:I
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;)I

    move-result v1

    goto :goto_0
.end method

.method public bridge synthetic getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    invoke-super {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public getBitmapCount()I
    .locals 1

    .prologue
    .line 235
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size()I

    move-result v0

    return v0
.end method

.method public getBlobs()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method public getCommits()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method public getCompressedBitmaps()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 253
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V

    return-object v0
.end method

.method public getObject(I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "position"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v0, v1, p1

    .line 203
    .local v0, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v0, :cond_0

    .line 204
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 205
    :cond_0
    return-object v0
.end method

.method public getObjectCount()I
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->byOffset:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    array-length v0, v0

    return v0
.end method

.method public getOptions()I
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x1

    return v0
.end method

.method public getTags()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method public getTrees()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method public ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "bitmap"
    .parameter "type"

    .prologue
    .line 179
    packed-switch p2, :pswitch_data_0

    .line 189
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 181
    :pswitch_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBlobs()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 187
    :goto_0
    return-object v0

    .line 183
    :pswitch_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getTrees()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 185
    :pswitch_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getCommits()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 187
    :pswitch_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getTags()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 179
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
