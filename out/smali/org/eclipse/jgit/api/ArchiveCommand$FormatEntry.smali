.class Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
.super Ljava/lang/Object;
.source "ArchiveCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/ArchiveCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FormatEntry"
.end annotation


# instance fields
.field final format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/api/ArchiveCommand$Format",
            "<*>;"
        }
    .end annotation
.end field

.field final refcnt:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/api/ArchiveCommand$Format;I)V
    .locals 1
    .parameter
    .parameter "refcnt"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/api/ArchiveCommand$Format",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    if-nez p1, :cond_0

    .line 203
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 204
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    .line 205
    iput p2, p0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->refcnt:I

    .line 206
    return-void
.end method
