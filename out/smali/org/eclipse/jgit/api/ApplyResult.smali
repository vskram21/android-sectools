.class public Lorg/eclipse/jgit/api/ApplyResult;
.super Ljava/lang/Object;
.source "ApplyResult.java"


# instance fields
.field private updatedFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/ApplyResult;->updatedFiles:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addUpdatedFile(Ljava/io/File;)Lorg/eclipse/jgit/api/ApplyResult;
    .locals 1
    .parameter "f"

    .prologue
    .line 64
    iget-object v0, p0, Lorg/eclipse/jgit/api/ApplyResult;->updatedFiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    return-object p0
.end method

.method public getUpdatedFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/api/ApplyResult;->updatedFiles:Ljava/util/List;

    return-object v0
.end method
