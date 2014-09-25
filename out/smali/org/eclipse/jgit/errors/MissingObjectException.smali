.class public Lorg/eclipse/jgit/errors/MissingObjectException;
.super Ljava/io/IOException;
.source "MissingObjectException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final missing:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V
    .locals 4
    .parameter "id"
    .parameter "type"

    .prologue
    .line 98
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->missingObject:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/errors/MissingObjectException;->missing:Lorg/eclipse/jgit/lib/ObjectId;

    .line 101
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;I)V
    .locals 1
    .parameter "id"
    .parameter "type"

    .prologue
    .line 85
    invoke-static {p2}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V
    .locals 4
    .parameter "id"
    .parameter "type"

    .prologue
    .line 73
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->missingObject:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/errors/MissingObjectException;->missing:Lorg/eclipse/jgit/lib/ObjectId;

    .line 75
    return-void
.end method


# virtual methods
.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/eclipse/jgit/errors/MissingObjectException;->missing:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method
