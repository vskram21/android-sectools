.class public Lorg/eclipse/jgit/api/RebaseResult;
.super Ljava/lang/Object;
.source "RebaseResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/RebaseResult$1;,
        Lorg/eclipse/jgit/api/RebaseResult$Status;
    }
.end annotation


# static fields
.field static final ABORTED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

.field static final FAST_FORWARD_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

.field static final INTERACTIVE_PREPARED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

.field static final NOTHING_TO_COMMIT_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

.field static final OK_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

.field static final STASH_APPLY_CONFLICTS_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

.field static final UP_TO_DATE_RESULT:Lorg/eclipse/jgit/api/RebaseResult;


# instance fields
.field private conflicts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final currentCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private failingPaths:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;"
        }
    .end annotation
.end field

.field private final status:Lorg/eclipse/jgit/api/RebaseResult$Status;

.field private uncommittedChanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 188
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->OK:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->OK_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 190
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->ABORTED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->ABORTED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 192
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->UP_TO_DATE:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->UP_TO_DATE_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 195
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAST_FORWARD:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->FAST_FORWARD_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 198
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->NOTHING_TO_COMMIT:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->NOTHING_TO_COMMIT_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 201
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->INTERACTIVE_PREPARED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->INTERACTIVE_PREPARED_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    .line 204
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->STASH_APPLY_CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseResult;->STASH_APPLY_CONFLICTS_RESULT:Lorg/eclipse/jgit/api/RebaseResult;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V
    .locals 1
    .parameter "status"

    .prologue
    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseResult;->status:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 219
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseResult;->currentCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 220
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/api/RebaseResult$Status;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 0
    .parameter "status"
    .parameter "commit"

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseResult;->status:Lorg/eclipse/jgit/api/RebaseResult$Status;

    .line 224
    iput-object p2, p0, Lorg/eclipse/jgit/api/RebaseResult;->currentCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 225
    return-void
.end method

.method static conflicts(Ljava/util/List;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/eclipse/jgit/api/RebaseResult;"
        }
    .end annotation

    .prologue
    .line 262
    .local p0, conflicts:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    .line 263
    .local v0, result:Lorg/eclipse/jgit/api/RebaseResult;
    iput-object p0, v0, Lorg/eclipse/jgit/api/RebaseResult;->conflicts:Ljava/util/List;

    .line 264
    return-object v0
.end method

.method static failed(Ljava/util/Map;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;)",
            "Lorg/eclipse/jgit/api/RebaseResult;"
        }
    .end annotation

    .prologue
    .line 249
    .local p0, failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->FAILED:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    .line 250
    .local v0, result:Lorg/eclipse/jgit/api/RebaseResult;
    iput-object p0, v0, Lorg/eclipse/jgit/api/RebaseResult;->failingPaths:Ljava/util/Map;

    .line 251
    return-object v0
.end method

.method static result(Lorg/eclipse/jgit/api/RebaseResult$Status;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 1
    .parameter "status"
    .parameter "commit"

    .prologue
    .line 237
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    return-object v0
.end method

.method static uncommittedChanges(Ljava/util/List;)Lorg/eclipse/jgit/api/RebaseResult;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/eclipse/jgit/api/RebaseResult;"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, uncommittedChanges:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lorg/eclipse/jgit/api/RebaseResult;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseResult$Status;->UNCOMMITTED_CHANGES:Lorg/eclipse/jgit/api/RebaseResult$Status;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/RebaseResult;-><init>(Lorg/eclipse/jgit/api/RebaseResult$Status;)V

    .line 277
    .local v0, result:Lorg/eclipse/jgit/api/RebaseResult;
    iput-object p0, v0, Lorg/eclipse/jgit/api/RebaseResult;->uncommittedChanges:Ljava/util/List;

    .line 278
    return-object v0
.end method


# virtual methods
.method public getConflicts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 309
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseResult;->conflicts:Ljava/util/List;

    return-object v0
.end method

.method public getCurrentCommit()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseResult;->currentCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    return-object v0
.end method

.method public getFailingPaths()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseResult;->failingPaths:Ljava/util/Map;

    return-object v0
.end method

.method public getStatus()Lorg/eclipse/jgit/api/RebaseResult$Status;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseResult;->status:Lorg/eclipse/jgit/api/RebaseResult$Status;

    return-object v0
.end method

.method public getUncommittedChanges()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 319
    iget-object v0, p0, Lorg/eclipse/jgit/api/RebaseResult;->uncommittedChanges:Ljava/util/List;

    return-object v0
.end method
