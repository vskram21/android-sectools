.class Lcom/jcraft/jsch/LocalIdentityRepository;
.super Ljava/lang/Object;
.source "LocalIdentityRepository.java"

# interfaces
.implements Lcom/jcraft/jsch/IdentityRepository;


# static fields
.field private static final name:Ljava/lang/String; = "Local Identity Repository"


# instance fields
.field private identities:Ljava/util/Vector;

.field private jsch:Lcom/jcraft/jsch/JSch;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .locals 1
    .parameter "jsch"

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    .line 41
    iput-object p1, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->jsch:Lcom/jcraft/jsch/JSch;

    .line 42
    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lcom/jcraft/jsch/Identity;)V
    .locals 1
    .parameter "identity"

    .prologue
    .line 61
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :cond_0
    monitor-exit p0

    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized add([B)Z
    .locals 5
    .parameter "identity"

    .prologue
    .line 68
    monitor-enter p0

    :try_start_0
    const-string v2, "from remote:"

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-static {v2, p1, v3, v4}, Lcom/jcraft/jsch/IdentityFile;->newInstance(Ljava/lang/String;[B[BLcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityFile;

    move-result-object v0

    .line 70
    .local v0, _identity:Lcom/jcraft/jsch/Identity;
    iget-object v2, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    const/4 v2, 0x1

    .line 74
    .end local v0           #_identity:Lcom/jcraft/jsch/Identity;
    :goto_0
    monitor-exit p0

    return v2

    .line 73
    :catch_0
    move-exception v1

    .line 74
    .local v1, e:Lcom/jcraft/jsch/JSchException;
    const/4 v2, 0x0

    goto :goto_0

    .line 68
    .end local v1           #e:Lcom/jcraft/jsch/JSchException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getIdentities()Ljava/util/Vector;
    .locals 3

    .prologue
    .line 53
    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 54
    .local v1, v:Ljava/util/Vector;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 55
    iget-object v2, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    :cond_0
    monitor-exit p0

    return-object v1

    .line 53
    .end local v0           #i:I
    .end local v1           #v:Ljava/util/Vector;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    const-string v0, "Local Identity Repository"

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x2

    return v0
.end method

.method declared-synchronized remove(Lcom/jcraft/jsch/Identity;)V
    .locals 1
    .parameter "identity"

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    monitor-exit p0

    return-void

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove([B)Z
    .locals 6
    .parameter "blob"

    .prologue
    const/4 v5, 0x0

    .line 83
    monitor-enter p0

    if-nez p1, :cond_0

    move v4, v5

    .line 93
    :goto_0
    monitor-exit p0

    return v4

    .line 84
    :cond_0
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    :try_start_0
    iget-object v4, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 85
    iget-object v4, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Identity;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/Identity;

    move-object v2, v0

    .line 86
    .local v2, _identity:Lcom/jcraft/jsch/Identity;
    invoke-interface {v2}, Lcom/jcraft/jsch/Identity;->getPublicKeyBlob()[B

    move-result-object v1

    .line 87
    .local v1, _blob:[B
    if-eqz v1, :cond_1

    invoke-static {p1, v1}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v4

    if-nez v4, :cond_2

    .line 84
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 89
    :cond_2
    iget-object v4, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 90
    invoke-interface {v2}, Lcom/jcraft/jsch/Identity;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    const/4 v4, 0x1

    goto :goto_0

    .end local v1           #_blob:[B
    .end local v2           #_identity:Lcom/jcraft/jsch/Identity;
    :cond_3
    move v4, v5

    .line 93
    goto :goto_0

    .line 83
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized removeAll()V
    .locals 4

    .prologue
    .line 97
    monitor-enter p0

    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 98
    iget-object v3, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Identity;

    move-object v0, v3

    check-cast v0, Lcom/jcraft/jsch/Identity;

    move-object v2, v0

    .line 99
    .local v2, identity:Lcom/jcraft/jsch/Identity;
    invoke-interface {v2}, Lcom/jcraft/jsch/Identity;->clear()V

    .line 97
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 101
    .end local v2           #identity:Lcom/jcraft/jsch/Identity;
    :cond_0
    iget-object v3, p0, Lcom/jcraft/jsch/LocalIdentityRepository;->identities:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->removeAllElements()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    monitor-exit p0

    return-void

    .line 97
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
