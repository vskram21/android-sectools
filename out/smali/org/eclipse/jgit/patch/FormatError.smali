.class public Lorg/eclipse/jgit/patch/FormatError;
.super Ljava/lang/Object;
.source "FormatError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/patch/FormatError$Severity;
    }
.end annotation


# instance fields
.field private final buf:[B

.field private final message:Ljava/lang/String;

.field private final offset:I

.field private final severity:Lorg/eclipse/jgit/patch/FormatError$Severity;


# direct methods
.method constructor <init>([BILorg/eclipse/jgit/patch/FormatError$Severity;Ljava/lang/String;)V
    .locals 0
    .parameter "buffer"
    .parameter "ptr"
    .parameter "sev"
    .parameter "msg"

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/patch/FormatError;->buf:[B

    .line 71
    iput p2, p0, Lorg/eclipse/jgit/patch/FormatError;->offset:I

    .line 72
    iput-object p3, p0, Lorg/eclipse/jgit/patch/FormatError;->severity:Lorg/eclipse/jgit/patch/FormatError$Severity;

    .line 73
    iput-object p4, p0, Lorg/eclipse/jgit/patch/FormatError;->message:Ljava/lang/String;

    .line 74
    return-void
.end method


# virtual methods
.method public getBuffer()[B
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FormatError;->buf:[B

    return-object v0
.end method

.method public getLineText()Ljava/lang/String;
    .locals 4

    .prologue
    .line 98
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FormatError;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/patch/FormatError;->offset:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 99
    .local v0, eol:I
    sget-object v1, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    iget-object v2, p0, Lorg/eclipse/jgit/patch/FormatError;->buf:[B

    iget v3, p0, Lorg/eclipse/jgit/patch/FormatError;->offset:I

    invoke-static {v1, v2, v3, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FormatError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getOffset()I
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lorg/eclipse/jgit/patch/FormatError;->offset:I

    return v0
.end method

.method public getSeverity()Lorg/eclipse/jgit/patch/FormatError$Severity;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FormatError;->severity:Lorg/eclipse/jgit/patch/FormatError$Severity;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FormatError;->getSeverity()Lorg/eclipse/jgit/patch/FormatError$Severity;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/patch/FormatError$Severity;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, ": at offset "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FormatError;->getOffset()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FormatError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    const-string v1, "  in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FormatError;->getLineText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
