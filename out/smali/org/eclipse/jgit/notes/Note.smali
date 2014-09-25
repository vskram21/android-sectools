.class public Lorg/eclipse/jgit/notes/Note;
.super Lorg/eclipse/jgit/lib/ObjectId;
.source "Note.java"


# instance fields
.field private data:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "noteOn"
    .parameter "noteData"

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 63
    iput-object p2, p0, Lorg/eclipse/jgit/notes/Note;->data:Lorg/eclipse/jgit/lib/ObjectId;

    .line 64
    return-void
.end method


# virtual methods
.method public getData()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/notes/Note;->data:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method setData(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "newData"

    .prologue
    .line 72
    iput-object p1, p0, Lorg/eclipse/jgit/notes/Note;->data:Lorg/eclipse/jgit/lib/ObjectId;

    .line 73
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Note["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/Note;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/notes/Note;->data:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
