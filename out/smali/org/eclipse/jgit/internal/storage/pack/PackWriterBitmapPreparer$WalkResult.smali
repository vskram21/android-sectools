.class final Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;
.super Ljava/lang/Object;
.source "PackWriterBitmapPreparer.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WalkResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# instance fields
.field private final commitStartPos:I

.field private final commitsByOldest:[Lorg/eclipse/jgit/revwalk/RevCommit;

.field private final paths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private final peeledWant:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final reuse:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/Set;[Lorg/eclipse/jgit/revwalk/RevCommit;ILjava/util/List;Ljava/lang/Iterable;)V
    .locals 0
    .parameter
    .parameter "commitsByOldest"
    .parameter "commitStartPos"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;[",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            "I",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 347
    .local p1, peeledWant:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p4, paths:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;>;"
    .local p5, reuse:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 348
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->peeledWant:Ljava/util/Set;

    .line 349
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitsByOldest:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 350
    iput p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitStartPos:I

    .line 351
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->paths:Ljava/util/List;

    .line 352
    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->reuse:Ljava/lang/Iterable;

    .line 353
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Set;[Lorg/eclipse/jgit/revwalk/RevCommit;ILjava/util/List;Ljava/lang/Iterable;Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 338
    invoke-direct/range {p0 .. p5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;-><init>(Ljava/util/Set;[Lorg/eclipse/jgit/revwalk/RevCommit;ILjava/util/List;Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)[Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "x0"

    .prologue
    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitsByOldest:[Lorg/eclipse/jgit/revwalk/RevCommit;

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 338
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitStartPos:I

    return v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/lang/Iterable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->reuse:Ljava/lang/Iterable;

    return-object v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/util/Set;
    .locals 1
    .parameter "x0"

    .prologue
    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->peeledWant:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$500(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->paths:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 356
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)V

    return-object v0
.end method
