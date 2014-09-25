.class public Lorg/eclipse/jgit/transport/FetchResult;
.super Lorg/eclipse/jgit/transport/OperationResult;
.source "FetchResult.java"


# instance fields
.field private final forMerge:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/FetchHeadRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/OperationResult;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchResult;->forMerge:Ljava/util/List;

    .line 63
    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/transport/FetchHeadRecord;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 66
    iget-boolean v0, p1, Lorg/eclipse/jgit/transport/FetchHeadRecord;->notForMerge:Z

    if-nez v0, :cond_0

    .line 67
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchResult;->forMerge:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    :cond_0
    return-void
.end method
