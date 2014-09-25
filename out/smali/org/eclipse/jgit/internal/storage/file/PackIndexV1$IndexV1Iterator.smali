.class Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;
.source "PackIndexV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IndexV1Iterator"
.end annotation


# instance fields
.field private levelOne:I

.field private levelTwo:I

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)V
    .locals 0
    .parameter

    .prologue
    .line 230
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 230
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)V

    return-void
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 230
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    return v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 230
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I

    return v0
.end method


# virtual methods
.method protected initEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .locals 1

    .prologue
    .line 237
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;)V

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 230
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->next()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .locals 4

    .prologue
    .line 246
    :goto_0
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)[[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 247
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)[[B

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    .line 246
    :goto_1
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    goto :goto_0

    .line 249
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)[[B

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    aget-object v1, v1, v2

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 250
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->entry:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)[[B

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelOne:I

    aget-object v1, v1, v2

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v1

    iput-wide v1, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->offset:J

    .line 251
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I

    add-int/lit8 v0, v0, 0x18

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I

    .line 252
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->returnedNumber:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->returnedNumber:J

    .line 253
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->entry:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    return-object v0

    .line 255
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;->levelTwo:I

    goto :goto_1

    .line 257
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method
