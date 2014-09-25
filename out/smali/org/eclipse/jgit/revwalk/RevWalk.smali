.class public Lorg/eclipse/jgit/revwalk/RevWalk;
.super Ljava/lang/Object;
.source "RevWalk.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# static fields
.field private static final APP_FLAGS:I = -0x40

.field private static final MB:I = 0x100000

.field static final PARSED:I = 0x1

.field static final RESERVED_FLAGS:I = 0x6

.field static final REWRITE:I = 0x8

.field static final SEEN:I = 0x2

.field static final TEMP_MARK:I = 0x10

.field static final TOPO_DELAY:I = 0x20

.field static final UNINTERESTING:I = 0x4


# instance fields
.field carryFlags:I

.field private delayFreeFlags:I

.field private filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field private freeFlags:I

.field final idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

.field objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevObject;",
            ">;"
        }
    .end annotation
.end field

.field pending:Lorg/eclipse/jgit/revwalk/Generator;

.field queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

.field final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private retainBody:Z

.field private rewriteParents:Z

.field final roots:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation
.end field

.field shallowCommitsInitialized:Z

.field private final sorting:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevSort;",
            ">;"
        }
    .end annotation
.end field

.field private treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 2
    .parameter "or"

    .prologue
    const/4 v1, 0x1

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    const/16 v0, -0x40

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    .line 177
    const/4 v0, 0x4

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    .line 193
    iput-boolean v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->rewriteParents:Z

    .line 218
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 219
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 220
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 221
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->roots:Ljava/util/ArrayList;

    .line 222
    new-instance v0, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/DateRevQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    .line 223
    new-instance v0, Lorg/eclipse/jgit/revwalk/StartGenerator;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/StartGenerator;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 224
    sget-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->NONE:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    .line 225
    sget-object v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 226
    sget-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 227
    iput-boolean v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->retainBody:Z

    .line 228
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 206
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 207
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectLoader;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseNew(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectLoader;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    return-object v0
.end method

.method private finishDelayedFreeFlags()V
    .locals 2

    .prologue
    .line 1122
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    if-eqz v0, :cond_0

    .line 1123
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    or-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    .line 1124
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    .line 1125
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    .line 1127
    :cond_0
    return-void
.end method

.method private isNotStarted()Z
    .locals 1

    .prologue
    .line 1301
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    instance-of v0, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;

    return v0
.end method

.method private parseNew(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectLoader;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 9
    .parameter "id"
    .parameter "ldr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 849
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/ObjectLoader;->getType()I

    move-result v3

    .line 850
    .local v3, type:I
    packed-switch v3, :pswitch_data_0

    .line 874
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->badObjectType:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 852
    :pswitch_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 853
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {p0, v0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;Lorg/eclipse/jgit/lib/ObjectLoader;)[B

    move-result-object v4

    invoke-virtual {v0, p0, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 854
    move-object v1, v0

    .line 877
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .local v1, r:Lorg/eclipse/jgit/revwalk/RevObject;
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 878
    return-object v1

    .line 858
    .end local v1           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    :pswitch_1
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevTree;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/revwalk/RevTree;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 859
    .restart local v1       #r:Lorg/eclipse/jgit/revwalk/RevObject;
    iget v4, v1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v4, v4, 0x1

    iput v4, v1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    goto :goto_0

    .line 863
    .end local v1           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    :pswitch_2
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevBlob;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/revwalk/RevBlob;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 864
    .restart local v1       #r:Lorg/eclipse/jgit/revwalk/RevObject;
    iget v4, v1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v4, v4, 0x1

    iput v4, v1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    goto :goto_0

    .line 868
    .end local v1           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    :pswitch_3
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevTag;

    invoke-direct {v2, p1}, Lorg/eclipse/jgit/revwalk/RevTag;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 869
    .local v2, t:Lorg/eclipse/jgit/revwalk/RevTag;
    invoke-virtual {p0, v2, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;Lorg/eclipse/jgit/lib/ObjectLoader;)[B

    move-result-object v4

    invoke-virtual {v2, p0, v4}, Lorg/eclipse/jgit/revwalk/RevTag;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 870
    move-object v1, v2

    .line 871
    .restart local v1       #r:Lorg/eclipse/jgit/revwalk/RevObject;
    goto :goto_0

    .line 850
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method allocFlag()I
    .locals 6

    .prologue
    .line 1055
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    if-nez v1, :cond_0

    .line 1056
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->flagsAlreadyCreated:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/16 v5, 0x1a

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1059
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    invoke-static {v1}, Ljava/lang/Integer;->lowestOneBit(I)I

    move-result v0

    .line 1060
    .local v0, m:I
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    .line 1061
    return v0
.end method

.method protected assertNotStarted()V
    .locals 2

    .prologue
    .line 1295
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->isNotStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1296
    return-void

    .line 1297
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->outputHasAlreadyBeenStarted:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public assumeShallow(Ljava/util/Collection;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1350
    .local p1, ids:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1351
    .local v1, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/revwalk/RevCommit;->NO_PARENTS:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v3, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    goto :goto_0

    .line 1352
    .end local v1           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    return-void
.end method

.method public carry(Ljava/util/Collection;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevFlag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1091
    .local p1, set:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/revwalk/RevFlag;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 1092
    .local v0, flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    goto :goto_0

    .line 1093
    .end local v0           #flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    :cond_0
    return-void
.end method

.method public carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 5
    .parameter "flag"

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 1074
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 1075
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->flagIsDisposed:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->name:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1076
    :cond_0
    iget-object v0, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    if-eq v0, p0, :cond_1

    .line 1077
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->flagNotFromThis:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->name:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1078
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    or-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    .line 1079
    return-void
.end method

.method carryFlagsImpl(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 3
    .parameter "c"

    .prologue
    .line 1336
    iget v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    iget v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    and-int v0, v1, v2

    .line 1337
    .local v0, carry:I
    if-eqz v0, :cond_0

    .line 1338
    invoke-static {p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryFlags(Lorg/eclipse/jgit/revwalk/RevCommit;I)V

    .line 1339
    :cond_0
    return-void
.end method

.method protected createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "id"

    .prologue
    .line 1332
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method

.method public dispose()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1227
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 1228
    const/16 v0, -0x40

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    .line 1229
    iput v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    .line 1230
    const/4 v0, 0x4

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    .line 1231
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->clear()V

    .line 1232
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 1233
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->roots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1234
    new-instance v0, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/DateRevQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    .line 1235
    new-instance v0, Lorg/eclipse/jgit/revwalk/StartGenerator;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/StartGenerator;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 1236
    iput-boolean v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->shallowCommitsInitialized:Z

    .line 1237
    return-void
.end method

.method public disposeFlag(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 1
    .parameter "flag"

    .prologue
    .line 1109
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlag(I)V

    .line 1110
    return-void
.end method

.method freeFlag(I)V
    .locals 2
    .parameter "mask"

    .prologue
    .line 1113
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->isNotStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1114
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    or-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    .line 1115
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlags:I

    .line 1119
    :goto_0
    return-void

    .line 1117
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    or-int/2addr v0, p1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->delayFreeFlags:I

    goto :goto_0
.end method

.method getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;)[B
    .locals 2
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 883
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;Lorg/eclipse/jgit/lib/ObjectLoader;)[B

    move-result-object v0

    return-object v0
.end method

.method getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;Lorg/eclipse/jgit/lib/ObjectLoader;)[B
    .locals 2
    .parameter "obj"
    .parameter "ldr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 889
    const/high16 v1, 0x50

    :try_start_0
    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/LargeObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 890
    :catch_0
    move-exception v0

    .line 891
    .local v0, tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/errors/LargeObjectException;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 892
    throw v0
.end method

.method public getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    return-object v0
.end method

.method public getRevFilter()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1

    .prologue
    .line 493
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    return-object v0
.end method

.method public getRevSort()Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevSort;",
            ">;"
        }
    .end annotation

    .prologue
    .line 431
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0}, Ljava/util/EnumSet;->clone()Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method getRewriteParents()Z
    .locals 1

    .prologue
    .line 575
    iget-boolean v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->rewriteParents:Z

    return v0
.end method

.method public getTreeFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1

    .prologue
    .line 528
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    return-object v0
.end method

.method public hasRevSort(Lorg/eclipse/jgit/revwalk/RevSort;)Z
    .locals 1
    .parameter "sort"

    .prologue
    .line 442
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method initializeShallowCommits()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1355
    iget-boolean v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->shallowCommitsInitialized:Z

    if-eqz v2, :cond_0

    .line 1356
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->shallowCommitsAlreadyInitialized:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1359
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->shallowCommitsInitialized:Z

    .line 1361
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    if-nez v2, :cond_2

    .line 1366
    :cond_1
    return-void

    .line 1364
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->getShallowCommits()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1365
    .local v1, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/revwalk/RevCommit;->NO_PARENTS:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v3, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    goto :goto_0
.end method

.method public isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 4
    .parameter "base"
    .parameter "tip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 386
    .local v1, oldRF:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 388
    .local v2, oldTF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->finishDelayedFreeFlags()V

    .line 389
    iget v3, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    xor-int/lit8 v3, v3, -0x1

    and-int/lit8 v3, v3, -0x40

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset(I)V

    .line 390
    sget-object v3, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 391
    sget-object v3, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 392
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 393
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 395
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .local v0, mergeBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v0, :cond_1

    .line 396
    if-ne v0, p1, :cond_0

    .line 397
    const/4 v3, 0x1

    .line 400
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 401
    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    :goto_0
    return v3

    .line 398
    :cond_1
    const/4 v3, 0x0

    .line 400
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 401
    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    goto :goto_0

    .line 400
    .end local v0           #mergeBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catchall_0
    move-exception v3

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 401
    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    throw v3
.end method

.method public isRetainBody()Z
    .locals 1

    .prologue
    .line 588
    iget-boolean v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->retainBody:Z

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3
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
    .line 1257
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    .line 1266
    .local v1, first:Lorg/eclipse/jgit/revwalk/RevCommit;
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk$3;

    invoke-direct {v2, p0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk$3;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    return-object v2

    .line 1258
    .end local v1           #first:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catch_0
    move-exception v0

    .line 1259
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    new-instance v2, Lorg/eclipse/jgit/errors/RevWalkException;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/errors/RevWalkException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1260
    .end local v0           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_1
    move-exception v0

    .line 1261
    .local v0, e:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    new-instance v2, Lorg/eclipse/jgit/errors/RevWalkException;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/errors/RevWalkException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1262
    .end local v0           #e:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    :catch_2
    move-exception v0

    .line 1263
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/errors/RevWalkException;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/errors/RevWalkException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 6
    .parameter "id"
    .parameter "type"

    .prologue
    .line 696
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 697
    .local v0, r:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v0, :cond_0

    .line 698
    packed-switch p2, :pswitch_data_0

    .line 712
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->invalidGitType:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 700
    :pswitch_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 715
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 717
    :cond_0
    return-object v0

    .line 703
    :pswitch_1
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevTree;

    .end local v0           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevTree;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 704
    .restart local v0       #r:Lorg/eclipse/jgit/revwalk/RevObject;
    goto :goto_0

    .line 706
    :pswitch_2
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevBlob;

    .end local v0           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevBlob;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 707
    .restart local v0       #r:Lorg/eclipse/jgit/revwalk/RevObject;
    goto :goto_0

    .line 709
    :pswitch_3
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local v0           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevTag;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 710
    .restart local v0       #r:Lorg/eclipse/jgit/revwalk/RevObject;
    goto :goto_0

    .line 698
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public lookupBlob(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevBlob;
    .locals 2
    .parameter "id"

    .prologue
    .line 615
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevBlob;

    .line 616
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevBlob;
    if-nez v0, :cond_0

    .line 617
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevBlob;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevBlob;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevBlob;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 618
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevBlob;
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 620
    :cond_0
    return-object v0
.end method

.method public lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 2
    .parameter "id"

    .prologue
    .line 656
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 657
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_0

    .line 658
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 659
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 661
    :cond_0
    return-object v0
.end method

.method public lookupOrNull(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 1
    .parameter "id"

    .prologue
    .line 729
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevObject;

    return-object v0
.end method

.method public lookupTag(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTag;
    .locals 2
    .parameter "id"

    .prologue
    .line 675
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevTag;

    .line 676
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevTag;
    if-nez v0, :cond_0

    .line 677
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevTag;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevTag;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 678
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevTag;
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 680
    :cond_0
    return-object v0
.end method

.method public lookupTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;
    .locals 2
    .parameter "id"

    .prologue
    .line 634
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevTree;

    .line 635
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevTree;
    if-nez v0, :cond_0

    .line 636
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevTree;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevTree;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevTree;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 637
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevTree;
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 639
    :cond_0
    return-object v0
.end method

.method public markStart(Ljava/util/Collection;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 307
    .local p1, list:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 308
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0

    .line 309
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    return-void
.end method

.method public markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 283
    :goto_0
    return-void

    .line 278
    :cond_0
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 279
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 280
    :cond_1
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 281
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->roots:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method

.method public markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 348
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->carryFlagsImpl(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 349
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 350
    return-void
.end method

.method public newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 2
    .parameter "name"

    .prologue
    .line 1050
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->allocFlag()I

    move-result v0

    .line 1051
    .local v0, m:I
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-direct {v1, p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevFlag;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;I)V

    return-object v1
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 421
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    .locals 8
    .parameter
    .parameter "reportMissing"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)",
            "Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;"
        }
    .end annotation

    .prologue
    .line 914
    .local p1, objectIds:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TT;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 915
    .local v4, need:Ljava/util/List;,"Ljava/util/List<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 916
    .local v0, have:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 917
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v7, v2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 918
    .local v6, r:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v6, :cond_0

    iget v7, v6, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    and-int/lit8 v7, v7, 0x1

    if-eqz v7, :cond_0

    .line 919
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 921
    :cond_0
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 924
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    .end local v6           #r:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 925
    .local v5, objItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 926
    new-instance v7, Lorg/eclipse/jgit/revwalk/RevWalk$1;

    invoke-direct {v7, p0, v5}, Lorg/eclipse/jgit/revwalk/RevWalk$1;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Iterator;)V

    .line 942
    :goto_1
    return-object v7

    .line 941
    :cond_2
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v7, v4, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    move-result-object v3

    .line 942
    .local v3, lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;,"Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue<TT;>;"
    new-instance v7, Lorg/eclipse/jgit/revwalk/RevWalk$2;

    invoke-direct {v7, p0, v5, v3}, Lorg/eclipse/jgit/revwalk/RevWalk$2;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Iterator;Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;)V

    goto :goto_1
.end method

.method public parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 837
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 838
    .local v0, r:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v0, :cond_0

    .line 839
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseNew(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectLoader;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 842
    :goto_0
    return-object v0

    .line 841
    :cond_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0
.end method

.method public parseBody(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 0
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1010
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevObject;->parseBody(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 1011
    return-void
.end method

.method public parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 4
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 752
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 753
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v1, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v1, :cond_0

    .line 754
    new-instance v1, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    const-string v3, "commit"

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v1

    .line 756
    :cond_0
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevObject;
    return-object v0
.end method

.method public parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 991
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 992
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevObject;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 993
    :cond_0
    return-void
.end method

.method public parseTag(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTag;
    .locals 4
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 812
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 813
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v1, v0, Lorg/eclipse/jgit/revwalk/RevTag;

    if-nez v1, :cond_0

    .line 814
    new-instance v1, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    const-string v3, "tag"

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v1

    .line 816
    :cond_0
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevObject;
    return-object v0
.end method

.method public parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;
    .locals 5
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 779
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 782
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v2, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v2, :cond_0

    .line 783
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v1

    .line 789
    .local v1, t:Lorg/eclipse/jgit/revwalk/RevTree;
    :goto_0
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 790
    return-object v1

    .line 784
    .end local v1           #t:Lorg/eclipse/jgit/revwalk/RevTree;
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_0
    instance-of v2, v0, Lorg/eclipse/jgit/revwalk/RevTree;

    if-nez v2, :cond_1

    .line 785
    new-instance v2, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    const-string v4, "tree"

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v2

    :cond_1
    move-object v1, v0

    .line 788
    check-cast v1, Lorg/eclipse/jgit/revwalk/RevTree;

    .restart local v1       #t:Lorg/eclipse/jgit/revwalk/RevTree;
    goto :goto_0
.end method

.method public peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 1
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1028
    :goto_0
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v0, :cond_0

    .line 1029
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 1030
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object p1

    .restart local p1
    goto :goto_0

    .line 1032
    :cond_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 1033
    return-object p1
.end method

.method public release()V
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 243
    return-void
.end method

.method public final reset()V
    .locals 1

    .prologue
    .line 1137
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset(I)V

    .line 1138
    return-void
.end method

.method protected reset(I)V
    .locals 8
    .parameter "retainFlags"

    .prologue
    .line 1185
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->finishDelayedFreeFlags()V

    .line 1186
    or-int/lit8 p1, p1, 0x1

    .line 1187
    xor-int/lit8 v2, p1, -0x1

    .line 1189
    .local v2, clearFlags:I
    new-instance v6, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v6}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    .line 1190
    .local v6, q:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->roots:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1191
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v7, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v7, v2

    if-eqz v7, :cond_0

    .line 1193
    iget v7, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v7, p1

    iput v7, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 1194
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->reset()V

    .line 1195
    invoke-virtual {v6, v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0

    .line 1202
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_1
    iget-object v7, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v7, :cond_3

    .line 1199
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_2
    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 1200
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_1

    .line 1213
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->roots:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 1214
    new-instance v7, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-direct {v7}, Lorg/eclipse/jgit/revwalk/DateRevQueue;-><init>()V

    iput-object v7, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    .line 1215
    new-instance v7, Lorg/eclipse/jgit/revwalk/StartGenerator;

    invoke-direct {v7, p0}, Lorg/eclipse/jgit/revwalk/StartGenerator;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    iput-object v7, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 1216
    return-void

    .line 1204
    :cond_3
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v5, v0, v3

    .line 1205
    .local v5, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v7, v2

    if-nez v7, :cond_4

    .line 1204
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1207
    :cond_4
    iget v7, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v7, p1

    iput v7, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 1208
    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevCommit;->reset()V

    .line 1209
    invoke-virtual {v6, v5}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_2
.end method

.method public final resetRetain(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V
    .locals 1
    .parameter "retainFlags"

    .prologue
    .line 1152
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset(I)V

    .line 1153
    return-void
.end method

.method public final varargs resetRetain([Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 6
    .parameter "retainFlags"

    .prologue
    .line 1167
    const/4 v4, 0x0

    .line 1168
    .local v4, mask:I
    move-object v0, p1

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevFlag;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 1169
    .local v1, flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    iget v5, v1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    or-int/2addr v4, v5

    .line 1168
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1170
    .end local v1           #flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    :cond_0
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset(I)V

    .line 1171
    return-void
.end method

.method public setRetainBody(Z)V
    .locals 0
    .parameter "retain"

    .prologue
    .line 601
    iput-boolean p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->retainBody:Z

    .line 602
    return-void
.end method

.method public setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V
    .locals 0
    .parameter "newFilter"

    .prologue
    .line 517
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->assertNotStarted()V

    .line 518
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 519
    return-void

    .line 518
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    goto :goto_0
.end method

.method public setRewriteParents(Z)V
    .locals 0
    .parameter "rewrite"

    .prologue
    .line 571
    iput-boolean p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->rewriteParents:Z

    .line 572
    return-void
.end method

.method public setTreeFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "newFilter"

    .prologue
    .line 552
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->assertNotStarted()V

    .line 553
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->treeFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 554
    return-void

    .line 553
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    goto :goto_0
.end method

.method public sort(Lorg/eclipse/jgit/revwalk/RevSort;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 455
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->assertNotStarted()V

    .line 456
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0}, Ljava/util/EnumSet;->clear()V

    .line 457
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 458
    return-void
.end method

.method public sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V
    .locals 2
    .parameter "s"
    .parameter "use"

    .prologue
    .line 475
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->assertNotStarted()V

    .line 476
    if-eqz p2, :cond_1

    .line 477
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 481
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0}, Ljava/util/EnumSet;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 482
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->NONE:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    .line 485
    :cond_0
    :goto_1
    return-void

    .line 479
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 483
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    invoke-virtual {v0}, Ljava/util/EnumSet;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 484
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->sorting:Ljava/util/EnumSet;

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->NONE:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public toObjectWalkWithSameObjects()Lorg/eclipse/jgit/revwalk/ObjectWalk;
    .locals 3

    .prologue
    .line 1317
    new-instance v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 1318
    .local v0, ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    move-object v1, v0

    .line 1319
    .local v1, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    iput-object v2, v1, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 1320
    iget v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    iput v2, v1, Lorg/eclipse/jgit/revwalk/RevWalk;->freeFlags:I

    .line 1321
    return-object v0
.end method
