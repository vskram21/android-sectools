.class public Lorg/eclipse/jgit/api/errors/PatchFormatException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "PatchFormatException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/FormatError;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/FormatError;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, errors:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/patch/FormatError;>;"
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->patchFormatException:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 67
    iput-object p1, p0, Lorg/eclipse/jgit/api/errors/PatchFormatException;->errors:Ljava/util/List;

    .line 68
    return-void
.end method


# virtual methods
.method public getErrors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/FormatError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/api/errors/PatchFormatException;->errors:Ljava/util/List;

    return-object v0
.end method
