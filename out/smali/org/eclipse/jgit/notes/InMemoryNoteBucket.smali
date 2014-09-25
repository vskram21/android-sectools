.class abstract Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
.super Lorg/eclipse/jgit/notes/NoteBucket;
.source "InMemoryNoteBucket.java"


# instance fields
.field nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

.field final prefixLen:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .parameter "prefixLen"

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteBucket;-><init>()V

    .line 69
    iput p1, p0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->prefixLen:I

    .line 70
    return-void
.end method


# virtual methods
.method abstract append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
.end method
