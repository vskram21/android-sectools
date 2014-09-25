.class public Lorg/eclipse/jgit/diff/PatchIdDiffFormatter;
.super Lorg/eclipse/jgit/diff/DiffFormatter;
.source "PatchIdDiffFormatter.java"


# instance fields
.field private final digest:Ljava/security/MessageDigest;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 63
    new-instance v0, Ljava/security/DigestOutputStream;

    sget-object v1, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/DiffFormatter;-><init>(Ljava/io/OutputStream;)V

    .line 65
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/PatchIdDiffFormatter;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Ljava/security/DigestOutputStream;

    invoke-virtual {v0}, Ljava/security/DigestOutputStream;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/PatchIdDiffFormatter;->digest:Ljava/security/MessageDigest;

    .line 66
    return-void
.end method


# virtual methods
.method protected formatIndexLine(Ljava/io/OutputStream;Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 0
    .parameter "o"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    return-void
.end method

.method public getCalulatedPatchId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/diff/PatchIdDiffFormatter;->digest:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method protected writeHunkHeader(IIII)V
    .locals 0
    .parameter "aStartLine"
    .parameter "aEndLine"
    .parameter "bStartLine"
    .parameter "bEndLine"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    return-void
.end method
