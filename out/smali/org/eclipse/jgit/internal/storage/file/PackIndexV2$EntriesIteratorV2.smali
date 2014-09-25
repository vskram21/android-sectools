.class Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;
.source "PackIndexV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EntriesIteratorV2"
.end annotation


# instance fields
.field private levelOne:I

.field private levelTwo:I

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)V
    .locals 0
    .parameter

    .prologue
    .line 302
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 302
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)V

    return-void
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 302
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I

    return v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 302
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I

    return v0
.end method


# virtual methods
.method protected initEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .locals 1

    .prologue
    .line 309
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;)V

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 302
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->next()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .locals 7

    .prologue
    .line 318
    :goto_0
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[[I

    move-result-object v4

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 319
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[[I

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I

    aget-object v4, v4, v5

    array-length v4, v4

    if-ge v3, v4, :cond_1

    .line 320
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I

    div-int/lit8 v3, v3, 0x5

    mul-int/lit8 v0, v3, 0x4

    .line 321
    .local v0, idx:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->access$400(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[[B

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I

    aget-object v3, v3, v4

    invoke-static {v3, v0}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v1

    .line 322
    .local v1, offset:J
    const-wide v3, 0x80000000L

    and-long/2addr v3, v1

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    .line 323
    const-wide v3, -0x80000001L

    and-long/2addr v3, v1

    long-to-int v3, v3

    mul-int/lit8 v0, v3, 0x8

    .line 324
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->access$500(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[B

    move-result-object v3

    invoke-static {v3, v0}, Lorg/eclipse/jgit/util/NB;->decodeUInt64([BI)J

    move-result-wide v1

    .line 326
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->entry:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    iput-wide v1, v3, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->offset:J

    .line 328
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I

    add-int/lit8 v3, v3, 0x5

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I

    .line 329
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->returnedNumber:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->returnedNumber:J

    .line 330
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->entry:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    return-object v3

    .line 332
    .end local v0           #idx:I
    .end local v1           #offset:J
    :cond_1
    const/4 v3, 0x0

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelTwo:I

    .line 318
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;->levelOne:I

    goto :goto_0

    .line 334
    :cond_2
    new-instance v3, Ljava/util/NoSuchElementException;

    invoke-direct {v3}, Ljava/util/NoSuchElementException;-><init>()V

    throw v3
.end method
