.class public interface abstract Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;
.super Ljava/lang/Object;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RemoteReader"
.end annotation


# virtual methods
.method public abstract readFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sha1(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation
.end method
