.class public abstract Lorg/eclipse/jgit/diff/ContentSource;
.super Ljava/lang/Object;
.source "ContentSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/ContentSource$1;,
        Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;,
        Lorg/eclipse/jgit/diff/ContentSource$Pair;,
        Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    return-void
.end method

.method public static create(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/diff/ContentSource;
    .locals 1
    .parameter "reader"

    .prologue
    .line 80
    new-instance v0, Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/diff/ContentSource$ObjectReaderSource;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    return-object v0
.end method

.method public static create(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)Lorg/eclipse/jgit/diff/ContentSource;
    .locals 1
    .parameter "iterator"

    .prologue
    .line 94
    new-instance v0, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/diff/ContentSource$WorkingTreeSource;-><init>(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    return-object v0
.end method


# virtual methods
.method public abstract open(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract size(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
