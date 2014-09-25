.class Lorg/eclipse/jgit/revwalk/AbstractRevQueue$AlwaysEmptyQueue;
.super Lorg/eclipse/jgit/revwalk/AbstractRevQueue;
.source "AbstractRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/AbstractRevQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AlwaysEmptyQueue"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/revwalk/AbstractRevQueue$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue$AlwaysEmptyQueue;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "c"

    .prologue
    .line 132
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method anybodyHasFlag(I)Z
    .locals 1
    .parameter "f"

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public clear()V
    .locals 0

    .prologue
    .line 153
    return-void
.end method

.method everbodyHasFlag(I)Z
    .locals 1
    .parameter "f"

    .prologue
    .line 147
    const/4 v0, 0x1

    return v0
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 137
    const/4 v0, 0x0

    return-object v0
.end method
