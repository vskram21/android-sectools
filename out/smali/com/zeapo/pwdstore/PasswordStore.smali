.class public Lcom/zeapo/pwdstore/PasswordStore;
.super Landroid/app/Activity;
.source "PasswordStore.java"

# interfaces
.implements Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;
.implements Lcom/zeapo/pwdstore/PasswordFragment$OnFragmentInteractionListener;


# instance fields
.field private activity:Landroid/app/Activity;

.field private currentDir:Ljava/io/File;

.field public leftActivity:Z

.field private scrollPositions:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private settings:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    return-void
.end method

.method static synthetic access$000(Lcom/zeapo/pwdstore/PasswordStore;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/zeapo/pwdstore/PasswordStore;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->settings:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$200(Lcom/zeapo/pwdstore/PasswordStore;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/zeapo/pwdstore/PasswordStore;->createRepository()V

    return-void
.end method

.method private checkLocalRepository()V
    .locals 1

    .prologue
    .line 214
    invoke-static {}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/PasswordStore;->checkLocalRepository(Ljava/io/File;)V

    .line 215
    return-void
.end method

.method private checkLocalRepository(Ljava/io/File;)V
    .locals 12
    .parameter "localDir"

    .prologue
    const v11, 0x7f090049

    const/4 v10, 0x0

    .line 218
    const-string v7, "PASS"

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    .line 220
    .local v3, fragmentManager:Landroid/app/FragmentManager;
    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v4

    .line 223
    .local v4, fragmentTransaction:Landroid/app/FragmentTransaction;
    iget-boolean v7, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    if-eqz v7, :cond_0

    .line 224
    iput-boolean v10, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    .line 269
    :goto_0
    return-void

    .line 228
    :cond_0
    const/4 v6, 0x0

    .line 230
    .local v6, status:I
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 231
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 232
    .local v2, folders:[Ljava/io/File;
    array-length v6, v2

    .line 235
    new-instance v7, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/.gpg-id"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 236
    add-int/lit8 v6, v6, 0x1

    .line 240
    .end local v2           #folders:[Ljava/io/File;
    :cond_1
    packed-switch v6, :pswitch_data_0

    .line 250
    new-instance v5, Lcom/zeapo/pwdstore/PasswordFragment;

    invoke-direct {v5}, Lcom/zeapo/pwdstore/PasswordFragment;-><init>()V

    .line 251
    .local v5, passFrag:Lcom/zeapo/pwdstore/PasswordFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 252
    .local v0, args:Landroid/os/Bundle;
    const-string v7, "Path"

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    iget-object v7, p0, Lcom/zeapo/pwdstore/PasswordStore;->scrollPositions:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 255
    const-string v8, "Position"

    iget-object v7, p0, Lcom/zeapo/pwdstore/PasswordStore;->scrollPositions:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v0, v8, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 259
    :goto_1
    invoke-virtual {v5, v0}, Lcom/zeapo/pwdstore/PasswordFragment;->setArguments(Landroid/os/Bundle;)V

    .line 261
    const-string v7, "PasswordsList"

    invoke-virtual {v3, v7}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 262
    const-string v7, "passlist"

    invoke-virtual {v4, v7}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 264
    :cond_2
    const-string v7, "PasswordsList"

    invoke-virtual {v4, v11, v5, v7}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 265
    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    .line 268
    .end local v0           #args:Landroid/os/Bundle;
    .end local v5           #passFrag:Lcom/zeapo/pwdstore/PasswordFragment;
    :cond_3
    :goto_2
    iput-boolean v10, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    goto :goto_0

    .line 242
    :pswitch_0
    invoke-static {}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getWorkTree()Ljava/io/File;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 245
    new-instance v1, Lcom/zeapo/pwdstore/ToCloneOrNot;

    invoke-direct {v1}, Lcom/zeapo/pwdstore/ToCloneOrNot;-><init>()V

    .line 246
    .local v1, cloneFrag:Lcom/zeapo/pwdstore/ToCloneOrNot;
    const-string v7, "ToCloneOrNot"

    invoke-virtual {v4, v11, v1, v7}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 247
    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    goto :goto_2

    .line 257
    .end local v1           #cloneFrag:Lcom/zeapo/pwdstore/ToCloneOrNot;
    .restart local v0       #args:Landroid/os/Bundle;
    .restart local v5       #passFrag:Lcom/zeapo/pwdstore/PasswordFragment;
    :cond_4
    const-string v7, "Position"

    invoke-virtual {v0, v7, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_1

    .line 240
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private createRepository()V
    .locals 6

    .prologue
    .line 145
    iget-object v3, p0, Lcom/zeapo/pwdstore/PasswordStore;->settings:Landroid/content/SharedPreferences;

    const-string v4, "openpgp_key_ids"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, keyId:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/store/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 148
    .local v2, localDir:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 152
    :try_start_0
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.gpg-id"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x8

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/apache/commons/io/FileUtils;->writeStringToFile(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    invoke-static {v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->createRepository(Ljava/io/File;)V

    .line 159
    invoke-direct {p0}, Lcom/zeapo/pwdstore/PasswordStore;->checkLocalRepository()V

    .line 160
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_0
.end method

.method private getCurrentDir()Ljava/io/File;
    .locals 3

    .prologue
    .line 354
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "PasswordsList"

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/zeapo/pwdstore/PasswordFragment;

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/PasswordFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "Path"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public createPassword(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 301
    invoke-direct {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getCurrentDir()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lcom/zeapo/pwdstore/PasswordStore;->currentDir:Ljava/io/File;

    .line 302
    const-string v2, "PWDSTR"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Adding file to : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/zeapo/pwdstore/PasswordStore;->currentDir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    .line 306
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 307
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "PGP-ID"

    const-string v3, "/.gpg-id"

    invoke-static {v3}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/io/FileUtils;->readFileToString(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 308
    const-string v2, "FILE_PATH"

    iget-object v3, p0, Lcom/zeapo/pwdstore/PasswordStore;->currentDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 309
    const-string v2, "Operation"

    const-string v3, "ENCRYPT"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 310
    const/16 v2, 0x26b7

    invoke-virtual {p0, v1, v2}, Lcom/zeapo/pwdstore/PasswordStore;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 314
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 311
    :catch_0
    move-exception v0

    .line 312
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public decryptPassword(Lcom/zeapo/pwdstore/utils/PasswordItem;)V
    .locals 4
    .parameter "item"

    .prologue
    .line 286
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    .line 288
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 289
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "PGP-ID"

    const-string v3, "/.gpg-id"

    invoke-static {v3}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/io/FileUtils;->readFileToString(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 290
    const-string v2, "NAME"

    invoke-virtual {p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 291
    const-string v2, "FILE_PATH"

    invoke-virtual {p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 292
    const-string v2, "Operation"

    const-string v3, "DECRYPT"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 293
    const/16 v2, 0x26b9

    invoke-virtual {p0, v1, v2}, Lcom/zeapo/pwdstore/PasswordStore;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 295
    :catch_0
    move-exception v0

    .line 296
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public deletePassword(Lcom/zeapo/pwdstore/utils/PasswordItem;)V
    .locals 3
    .parameter "item"

    .prologue
    .line 317
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Are you sure you want to delete the password \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "YES"

    new-instance v2, Lcom/zeapo/pwdstore/PasswordStore$6;

    invoke-direct {v2, p0, p1}, Lcom/zeapo/pwdstore/PasswordStore$6;-><init>(Lcom/zeapo/pwdstore/PasswordStore;Lcom/zeapo/pwdstore/utils/PasswordItem;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "NO"

    new-instance v2, Lcom/zeapo/pwdstore/PasswordStore$5;

    invoke-direct {v2, p0}, Lcom/zeapo/pwdstore/PasswordStore$5;-><init>(Lcom/zeapo/pwdstore/PasswordStore;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 343
    return-void
.end method

.method public getClone(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    const/16 v2, 0x67

    .line 139
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 140
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "Operation"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 141
    invoke-virtual {p0, v0, v2}, Lcom/zeapo/pwdstore/PasswordStore;->startActivityForResult(Landroid/content/Intent;I)V

    .line 142
    return-void
.end method

.method public initRepository(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 163
    iget-object v1, p0, Lcom/zeapo/pwdstore/PasswordStore;->settings:Landroid/content/SharedPreferences;

    const-string v2, "openpgp_key_ids"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 165
    .local v0, keyId:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 166
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "You have to select your \"PGP-Key ID\" before initializing the repository"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "On my way!"

    new-instance v3, Lcom/zeapo/pwdstore/PasswordStore$2;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/PasswordStore$2;-><init>(Lcom/zeapo/pwdstore/PasswordStore;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Nah... later"

    new-instance v3, Lcom/zeapo/pwdstore/PasswordStore$1;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/PasswordStore$1;-><init>(Lcom/zeapo/pwdstore/PasswordStore;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 206
    :goto_0
    return-void

    .line 184
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Which connection method do you prefer?"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "ssh-key"

    new-instance v3, Lcom/zeapo/pwdstore/PasswordStore$4;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/PasswordStore$4;-><init>(Lcom/zeapo/pwdstore/PasswordStore;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "username/password"

    new-instance v3, Lcom/zeapo/pwdstore/PasswordStore$3;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/PasswordStore$3;-><init>(Lcom/zeapo/pwdstore/PasswordStore;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 8
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v5, 0x0

    .line 359
    if-nez p2, :cond_0

    .line 360
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->refreshListAdapter()V

    .line 362
    :cond_0
    const/4 v2, -0x1

    if-ne p2, v2, :cond_1

    .line 363
    const/16 v2, 0x67

    if-ne p1, v2, :cond_2

    .line 364
    invoke-direct {p0}, Lcom/zeapo/pwdstore/PasswordStore;->checkLocalRepository()V

    .line 368
    :goto_0
    sparse-switch p1, :sswitch_data_0

    .line 383
    :cond_1
    :goto_1
    return-void

    .line 366
    :cond_2
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->refreshListAdapter()V

    goto :goto_0

    .line 370
    :sswitch_0
    new-instance v0, Lorg/eclipse/jgit/api/Git;

    new-instance v2, Ljava/io/File;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 371
    .local v0, git:Lorg/eclipse/jgit/api/Git;
    new-instance v1, Lcom/zeapo/pwdstore/GitAsyncTask;

    const-class v2, Lorg/eclipse/jgit/api/CommitCommand;

    invoke-direct {v1, p0, v5, v5, v2}, Lcom/zeapo/pwdstore/GitAsyncTask;-><init>(Landroid/app/Activity;ZZLjava/lang/Class;)V

    .line 372
    .local v1, tasks:Lcom/zeapo/pwdstore/GitAsyncTask;
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/eclipse/jgit/api/GitCommand;

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/Git;->add()Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/api/AddCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v3

    aput-object v3, v2, v5

    const/4 v3, 0x1

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[ANDROID PwdStore] Add "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "NAME"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from store."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/GitAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 378
    .end local v0           #git:Lorg/eclipse/jgit/api/Git;
    .end local v1           #tasks:Lcom/zeapo/pwdstore/GitAsyncTask;
    :sswitch_1
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/PasswordStore;->initRepository(Landroid/view/View;)V

    goto :goto_1

    .line 368
    :sswitch_data_0
    .sparse-switch
        0x68 -> :sswitch_1
        0x26b7 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const v0, 0x7f030019

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/PasswordStore;->setContentView(I)V

    .line 57
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->scrollPositions:Ljava/util/Stack;

    .line 58
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->settings:Landroid/content/SharedPreferences;

    .line 59
    iput-object p0, p0, Lcom/zeapo/pwdstore/PasswordStore;->activity:Landroid/app/Activity;

    .line 60
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0e0003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 83
    const/4 v0, 0x1

    return v0
.end method

.method public onFragmentInteraction(Landroid/net/Uri;)V
    .locals 0
    .parameter "uri"

    .prologue
    .line 211
    return-void
.end method

.method public onFragmentInteraction(Lcom/zeapo/pwdstore/utils/PasswordItem;)V
    .locals 2
    .parameter "item"

    .prologue
    .line 280
    invoke-virtual {p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getType()C

    move-result v0

    const/16 v1, 0x63

    if-ne v0, v1, :cond_0

    .line 281
    invoke-virtual {p1}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/PasswordStore;->checkLocalRepository(Ljava/io/File;)V

    .line 283
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .parameter "item"

    .prologue
    const/16 v6, 0x66

    const/16 v5, 0x65

    const/4 v3, 0x1

    .line 91
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 94
    .local v1, id:I
    packed-switch v1, :pswitch_data_0

    .line 135
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    :goto_1
    return v3

    .line 97
    :pswitch_1
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 98
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/PasswordStore;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .end local v2           #intent:Landroid/content/Intent;
    :goto_2
    iput-boolean v3, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    goto :goto_1

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, e:Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception caught :("

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 101
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 107
    .end local v0           #e:Ljava/lang/Exception;
    :pswitch_2
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getCurrentFocus()Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/zeapo/pwdstore/PasswordStore;->createPassword(Landroid/view/View;)V

    goto :goto_0

    .line 114
    :pswitch_3
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 115
    .restart local v2       #intent:Landroid/content/Intent;
    const-string v4, "Operation"

    invoke-virtual {v2, v4, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 116
    invoke-virtual {p0, v2, v6}, Lcom/zeapo/pwdstore/PasswordStore;->startActivityForResult(Landroid/content/Intent;I)V

    .line 117
    iput-boolean v3, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    goto :goto_1

    .line 121
    .end local v2           #intent:Landroid/content/Intent;
    :pswitch_4
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 122
    .restart local v2       #intent:Landroid/content/Intent;
    const-string v4, "Operation"

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 123
    invoke-virtual {p0, v2, v5}, Lcom/zeapo/pwdstore/PasswordStore;->startActivityForResult(Landroid/content/Intent;I)V

    .line 124
    iput-boolean v3, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    goto :goto_1

    .line 128
    .end local v2           #intent:Landroid/content/Intent;
    :pswitch_5
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->refreshListAdapter()V

    goto :goto_1

    .line 94
    :pswitch_data_0
    .packed-switch 0x7f090073
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_5
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 75
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->leftActivity:Z

    .line 77
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 64
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 67
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/store/.git"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    .line 70
    invoke-direct {p0}, Lcom/zeapo/pwdstore/PasswordStore;->checkLocalRepository()V

    .line 71
    return-void
.end method

.method public refreshListAdapter()V
    .locals 3

    .prologue
    .line 347
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/PasswordStore;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "PasswordsList"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/zeapo/pwdstore/PasswordFragment;

    .local v0, plist:Lcom/zeapo/pwdstore/PasswordFragment;
    if-eqz v0, :cond_0

    .line 349
    invoke-virtual {v0}, Lcom/zeapo/pwdstore/PasswordFragment;->updateAdapter()V

    .line 351
    :cond_0
    return-void
.end method

.method public savePosition(Ljava/lang/Integer;)V
    .locals 1
    .parameter "position"

    .prologue
    .line 274
    iget-object v0, p0, Lcom/zeapo/pwdstore/PasswordStore;->scrollPositions:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    return-void
.end method
