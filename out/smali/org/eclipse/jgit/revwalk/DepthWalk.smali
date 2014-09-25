.class public interface abstract Lorg/eclipse/jgit/revwalk/DepthWalk;
.super Ljava/lang/Object;
.source "DepthWalk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;,
        Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;,
        Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;
    }
.end annotation


# virtual methods
.method public abstract getDepth()I
.end method

.method public abstract getReinterestingFlag()Lorg/eclipse/jgit/revwalk/RevFlag;
.end method

.method public abstract getUnshallowFlag()Lorg/eclipse/jgit/revwalk/RevFlag;
.end method
