.class public Lorg/eclipse/jgit/api/CherryPickResult;
.super Ljava/lang/Object;
.source "CherryPickResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/CherryPickResult$1;,
        Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
    }
.end annotation


# static fields
.field public static final CONFLICT:Lorg/eclipse/jgit/api/CherryPickResult;


# instance fields
.field private final cherryPickedRefs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private final failingPaths:Ljava/util/Map;
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

.field private final newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private final status:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 129
    new-instance v0, Lorg/eclipse/jgit/api/CherryPickResult;

    sget-object v1, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->CONFLICTING:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CherryPickResult;-><init>(Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;)V

    sput-object v0, Lorg/eclipse/jgit/api/CherryPickResult;->CONFLICT:Lorg/eclipse/jgit/api/CherryPickResult;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    const/4 v1, 0x0

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    sget-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->FAILED:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->status:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    .line 113
    iput-object v1, p0, Lorg/eclipse/jgit/api/CherryPickResult;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 114
    iput-object v1, p0, Lorg/eclipse/jgit/api/CherryPickResult;->cherryPickedRefs:Ljava/util/List;

    .line 115
    iput-object p1, p0, Lorg/eclipse/jgit/api/CherryPickResult;->failingPaths:Ljava/util/Map;

    .line 116
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;)V
    .locals 1
    .parameter "status"

    .prologue
    const/4 v0, 0x0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object p1, p0, Lorg/eclipse/jgit/api/CherryPickResult;->status:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    .line 120
    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 121
    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->cherryPickedRefs:Ljava/util/List;

    .line 122
    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->failingPaths:Ljava/util/Map;

    .line 123
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/revwalk/RevCommit;Ljava/util/List;)V
    .locals 1
    .parameter "newHead"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p2, cherryPickedRefs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    sget-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->OK:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->status:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    .line 101
    iput-object p1, p0, Lorg/eclipse/jgit/api/CherryPickResult;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 102
    iput-object p2, p0, Lorg/eclipse/jgit/api/CherryPickResult;->cherryPickedRefs:Ljava/util/List;

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->failingPaths:Ljava/util/Map;

    .line 104
    return-void
.end method


# virtual methods
.method public getCherryPickedRefs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 154
    iget-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->cherryPickedRefs:Ljava/util/List;

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
    .line 164
    iget-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->failingPaths:Ljava/util/Map;

    return-object v0
.end method

.method public getNewHead()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->newHead:Lorg/eclipse/jgit/revwalk/RevCommit;

    return-object v0
.end method

.method public getStatus()Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/eclipse/jgit/api/CherryPickResult;->status:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    return-object v0
.end method
