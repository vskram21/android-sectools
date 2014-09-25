.class public Lorg/eclipse/jgit/notes/NotesMergeConflictException;
.super Ljava/io/IOException;
.source "NotesMergeConflictException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;)V
    .locals 4
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"

    .prologue
    .line 88
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->mergeConflictOnNonNoteEntries:Ljava/lang/String;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->name(Lorg/eclipse/jgit/notes/NonNoteEntry;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->name(Lorg/eclipse/jgit/notes/NonNoteEntry;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->name(Lorg/eclipse/jgit/notes/NonNoteEntry;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)V
    .locals 4
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"

    .prologue
    .line 70
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->mergeConflictOnNotes:Ljava/lang/String;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->noteOn(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->noteData(Lorg/eclipse/jgit/notes/Note;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->noteData(Lorg/eclipse/jgit/notes/Note;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;->noteData(Lorg/eclipse/jgit/notes/Note;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method private static name(Lorg/eclipse/jgit/notes/NonNoteEntry;)Ljava/lang/String;
    .locals 1
    .parameter "e"

    .prologue
    .line 108
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->name()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private static noteData(Lorg/eclipse/jgit/notes/Note;)Ljava/lang/String;
    .locals 1
    .parameter "n"

    .prologue
    .line 102
    if-eqz p0, :cond_0

    .line 103
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    .line 104
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private static noteOn(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Ljava/lang/String;
    .locals 1
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"

    .prologue
    .line 94
    if-eqz p0, :cond_0

    .line 95
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/Note;->name()Ljava/lang/String;

    move-result-object v0

    .line 98
    :goto_0
    return-object v0

    .line 96
    :cond_0
    if-eqz p1, :cond_1

    .line 97
    invoke-virtual {p1}, Lorg/eclipse/jgit/notes/Note;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 98
    :cond_1
    invoke-virtual {p2}, Lorg/eclipse/jgit/notes/Note;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
