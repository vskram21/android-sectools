.class public Lcom/zeapo/pwdstore/utils/PasswordItem;
.super Ljava/lang/Object;
.source "PasswordItem.java"

# interfaces
.implements Ljava/lang/Comparable;


# static fields
.field public static final TYPE_CATEGORY:C = 'c'

.field public static final TYPE_PASSWORD:C = 'p'


# instance fields
.field private file:Ljava/io/File;

.field private name:Ljava/lang/String;

.field private parent:Lcom/zeapo/pwdstore/utils/PasswordItem;

.field public selected:Z

.field private type:C


# direct methods
.method protected constructor <init>(Ljava/lang/String;Lcom/zeapo/pwdstore/utils/PasswordItem;CLjava/io/File;)V
    .locals 1
    .parameter "name"
    .parameter "parent"
    .parameter "type"
    .parameter "file"

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->selected:Z

    .line 24
    iput-object p1, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->name:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->parent:Lcom/zeapo/pwdstore/utils/PasswordItem;

    .line 26
    iput-char p3, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->type:C

    .line 27
    iput-object p4, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->file:Ljava/io/File;

    .line 28
    return-void
.end method

.method public static newCategory(Ljava/lang/String;Ljava/io/File;)Lcom/zeapo/pwdstore/utils/PasswordItem;
    .locals 3
    .parameter "name"
    .parameter "file"

    .prologue
    .line 46
    new-instance v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    const/4 v1, 0x0

    const/16 v2, 0x63

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;-><init>(Ljava/lang/String;Lcom/zeapo/pwdstore/utils/PasswordItem;CLjava/io/File;)V

    return-object v0
.end method

.method public static newCategory(Ljava/lang/String;Ljava/io/File;Lcom/zeapo/pwdstore/utils/PasswordItem;)Lcom/zeapo/pwdstore/utils/PasswordItem;
    .locals 2
    .parameter "name"
    .parameter "file"
    .parameter "parent"

    .prologue
    .line 37
    new-instance v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    const/16 v1, 0x63

    invoke-direct {v0, p0, p2, v1, p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;-><init>(Ljava/lang/String;Lcom/zeapo/pwdstore/utils/PasswordItem;CLjava/io/File;)V

    return-object v0
.end method

.method public static newPassword(Ljava/lang/String;Ljava/io/File;)Lcom/zeapo/pwdstore/utils/PasswordItem;
    .locals 3
    .parameter "name"
    .parameter "file"

    .prologue
    .line 65
    new-instance v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    const/4 v1, 0x0

    const/16 v2, 0x70

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;-><init>(Ljava/lang/String;Lcom/zeapo/pwdstore/utils/PasswordItem;CLjava/io/File;)V

    return-object v0
.end method

.method public static newPassword(Ljava/lang/String;Ljava/io/File;Lcom/zeapo/pwdstore/utils/PasswordItem;)Lcom/zeapo/pwdstore/utils/PasswordItem;
    .locals 2
    .parameter "name"
    .parameter "file"
    .parameter "parent"

    .prologue
    .line 56
    new-instance v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    const/16 v1, 0x70

    invoke-direct {v0, p0, p2, v1, p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;-><init>(Ljava/lang/String;Lcom/zeapo/pwdstore/utils/PasswordItem;CLjava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 4
    .parameter "o"

    .prologue
    .line 99
    move-object v0, p1

    check-cast v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    .line 101
    .local v0, other:Lcom/zeapo/pwdstore/utils/PasswordItem;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "o"

    .prologue
    .line 91
    move-object v0, p1

    check-cast v0, Lcom/zeapo/pwdstore/utils/PasswordItem;

    .line 93
    .local v0, other:Lcom/zeapo/pwdstore/utils/PasswordItem;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->file:Ljava/io/File;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lcom/zeapo/pwdstore/utils/PasswordItem;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->parent:Lcom/zeapo/pwdstore/utils/PasswordItem;

    return-object v0
.end method

.method public getType()C
    .locals 1

    .prologue
    .line 69
    iget-char v0, p0, Lcom/zeapo/pwdstore/utils/PasswordItem;->type:C

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 86
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".gpg"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
