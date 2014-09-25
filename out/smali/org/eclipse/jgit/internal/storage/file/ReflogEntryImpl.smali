.class public Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;
.super Ljava/lang/Object;
.source "ReflogEntryImpl.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lorg/eclipse/jgit/lib/ReflogEntry;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private comment:Ljava/lang/String;

.field private newId:Lorg/eclipse/jgit/lib/ObjectId;

.field private oldId:Lorg/eclipse/jgit/lib/ObjectId;

.field private who:Lorg/eclipse/jgit/lib/PersonIdent;


# direct methods
.method constructor <init>([BI)V
    .locals 5
    .parameter "raw"
    .parameter "pos"

    .prologue
    const/16 v4, 0x20

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-static {p1, p2}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 73
    add-int/lit8 p2, p2, 0x28

    .line 74
    add-int/lit8 v2, p2, 0x1

    .end local p2
    .local v2, pos:I
    aget-byte v3, p1, p2

    if-eq v3, v4, :cond_0

    .line 75
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->rawLogMessageDoesNotParseAsLogEntry:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 77
    :cond_0
    invoke-static {p1, v2}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 78
    add-int/lit8 p2, v2, 0x28

    .line 79
    .end local v2           #pos:I
    .restart local p2
    add-int/lit8 v2, p2, 0x1

    .end local p2
    .restart local v2       #pos:I
    aget-byte v3, p1, p2

    if-eq v3, v4, :cond_1

    .line 80
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->rawLogMessageDoesNotParseAsLogEntry:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 83
    :cond_1
    invoke-static {p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parsePersonIdentOnly([BI)Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->who:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 84
    const/16 v3, 0x9

    invoke-static {p1, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v0

    .line 85
    .local v0, p0:I
    array-length v3, p1

    if-lt v0, v3, :cond_2

    .line 86
    const-string v3, ""

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->comment:Ljava/lang/String;

    .line 91
    :goto_0
    return-void

    .line 88
    :cond_2
    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 89
    .local v1, p1:I
    if-le v1, v0, :cond_3

    add-int/lit8 v3, v1, -0x1

    invoke-static {p1, v0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v3

    :goto_1
    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->comment:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const-string v3, ""

    goto :goto_1
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getNewId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getOldId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getWho()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->who:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public parseCheckout()Lorg/eclipse/jgit/lib/CheckoutEntry;
    .locals 2

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->getComment()Ljava/lang/String;

    move-result-object v0

    const-string v1, "checkout: moving from "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;-><init>(Lorg/eclipse/jgit/lib/ReflogEntry;)V

    .line 135
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Entry["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->getWho()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ReflogEntryImpl;->getComment()Ljava/lang/String;

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
