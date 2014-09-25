.class public Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
.super Lorg/eclipse/jgit/revwalk/RevCommit;
.source "DepthWalk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/DepthWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Commit"
.end annotation


# instance fields
.field depth:I


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    .line 85
    return-void
.end method


# virtual methods
.method public getDepth()I
    .locals 1

    .prologue
    .line 73
    iget v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    return v0
.end method
