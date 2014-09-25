.class public Lcom/jcraft/jsch/IdentityRepository$Wrapper;
.super Ljava/lang/Object;
.source "IdentityRepository.java"

# interfaces
.implements Lcom/jcraft/jsch/IdentityRepository;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/IdentityRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Wrapper"
.end annotation


# instance fields
.field private cache:Ljava/util/Vector;

.field private ir:Lcom/jcraft/jsch/IdentityRepository;

.field private keep_in_cache:Z


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/IdentityRepository;)V
    .locals 1
    .parameter "ir"

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;-><init>(Lcom/jcraft/jsch/IdentityRepository;Z)V

    .line 58
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/IdentityRepository;Z)V
    .locals 1
    .parameter "ir"
    .parameter "keep_in_cache"

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->keep_in_cache:Z

    .line 60
    iput-object p1, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    .line 61
    iput-boolean p2, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->keep_in_cache:Z

    .line 62
    return-void
.end method


# virtual methods
.method add(Lcom/jcraft/jsch/Identity;)V
    .locals 2
    .parameter "identity"

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->keep_in_cache:Z

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/jcraft/jsch/Identity;->isEncrypted()Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/jcraft/jsch/IdentityFile;

    if-eqz v0, :cond_0

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    check-cast p1, Lcom/jcraft/jsch/IdentityFile;

    .end local p1
    invoke-virtual {p1}, Lcom/jcraft/jsch/IdentityFile;->getKeyPair()Lcom/jcraft/jsch/KeyPair;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jcraft/jsch/KeyPair;->forSSHAgent()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/IdentityRepository;->add([B)Z
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :goto_0
    return-void

    .line 102
    .restart local p1
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 97
    .end local p1
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public add([B)Z
    .locals 1
    .parameter "identity"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v0, p1}, Lcom/jcraft/jsch/IdentityRepository;->add([B)Z

    move-result v0

    return v0
.end method

.method check()V
    .locals 4

    .prologue
    .line 105
    iget-object v3, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 106
    iget-object v3, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 107
    .local v1, identities:[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 108
    aget-object v3, v1, v0

    check-cast v3, Lcom/jcraft/jsch/Identity;

    move-object v2, v3

    check-cast v2, Lcom/jcraft/jsch/Identity;

    .line 109
    .local v2, identity:Lcom/jcraft/jsch/Identity;
    iget-object v3, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 110
    invoke-virtual {p0, v2}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->add(Lcom/jcraft/jsch/Identity;)V

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 113
    .end local v0           #i:I
    .end local v1           #identities:[Ljava/lang/Object;
    .end local v2           #identity:Lcom/jcraft/jsch/Identity;
    :cond_0
    return-void
.end method

.method public getIdentities()Ljava/util/Vector;
    .locals 5

    .prologue
    .line 80
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 81
    .local v2, result:Ljava/util/Vector;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v4, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 82
    iget-object v4, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Identity;

    move-object v1, v4

    check-cast v1, Lcom/jcraft/jsch/Identity;

    .line 83
    .local v1, identity:Lcom/jcraft/jsch/Identity;
    invoke-virtual {v2, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 85
    .end local v1           #identity:Lcom/jcraft/jsch/Identity;
    :cond_0
    iget-object v4, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v4}, Lcom/jcraft/jsch/IdentityRepository;->getIdentities()Ljava/util/Vector;

    move-result-object v3

    .line 86
    .local v3, tmp:Ljava/util/Vector;
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 87
    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 89
    :cond_1
    return-object v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v0}, Lcom/jcraft/jsch/IdentityRepository;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v0}, Lcom/jcraft/jsch/IdentityRepository;->getStatus()I

    move-result v0

    return v0
.end method

.method public remove([B)Z
    .locals 1
    .parameter "blob"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v0, p1}, Lcom/jcraft/jsch/IdentityRepository;->remove([B)Z

    move-result v0

    return v0
.end method

.method public removeAll()V
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->cache:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 77
    iget-object v0, p0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->ir:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v0}, Lcom/jcraft/jsch/IdentityRepository;->removeAll()V

    .line 78
    return-void
.end method
