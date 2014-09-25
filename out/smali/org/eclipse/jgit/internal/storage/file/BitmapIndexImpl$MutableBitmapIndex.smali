.class final Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;
.super Ljava/lang/Object;
.source "BitmapIndexImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MutableBitmapIndex"
.end annotation


# instance fields
.field private final revList:Lorg/eclipse/jgit/util/BlockList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/BlockList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final revMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 395
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 396
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 399
    new-instance v0, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revList:Lorg/eclipse/jgit/util/BlockList;

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 395
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;-><init>()V

    return-void
.end method


# virtual methods
.method addObject(Lorg/eclipse/jgit/lib/AnyObjectId;I)I
    .locals 2
    .parameter "objectId"
    .parameter "type"

    .prologue
    .line 423
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revList:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v1

    invoke-direct {v0, p1, p2, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;II)V

    .line 425
    .local v0, entry:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revList:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 426
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 427
    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->position:I
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->access$1800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;)I

    move-result v1

    return v1
.end method

.method findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 2
    .parameter "objectId"

    .prologue
    .line 403
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;

    .line 404
    .local v0, entry:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    if-nez v0, :cond_0

    .line 405
    const/4 v1, -0x1

    .line 406
    :goto_0
    return v1

    :cond_0
    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->position:I
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->access$1800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;)I

    move-result v1

    goto :goto_0
.end method

.method getObject(I)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    .locals 7
    .parameter "position"

    .prologue
    .line 411
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->revList:Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;

    .line 412
    .local v0, entry:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    if-nez v0, :cond_0

    .line 413
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->objectNotFound:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    .end local v0           #entry:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    :catch_0
    move-exception v1

    .line 418
    .local v1, ex:Ljava/lang/IndexOutOfBoundsException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 416
    .end local v1           #ex:Ljava/lang/IndexOutOfBoundsException;
    .restart local v0       #entry:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    :cond_0
    return-object v0
.end method
