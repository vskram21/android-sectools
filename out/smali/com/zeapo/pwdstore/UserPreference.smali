.class public Lcom/zeapo/pwdstore/UserPreference;
.super Landroid/preference/PreferenceActivity;
.source "UserPreference.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v3, -0x1

    .line 69
    if-ne p2, v3, :cond_0

    .line 70
    const/4 v3, 0x1

    if-ne p1, v3, :cond_0

    .line 73
    :try_start_0
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/UserPreference;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 74
    .local v2, sshKey:Ljava/io/InputStream;
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 75
    .local v1, privateKey:[B
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/UserPreference;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.ssh_key"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v1}, Lorg/apache/commons/io/FileUtils;->writeByteArrayToFile(Ljava/io/File;[B)V

    .line 76
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 78
    const-string v3, "PREF"

    const-string v4, "Got key"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v3, -0x1

    invoke-virtual {p0, v3}, Lcom/zeapo/pwdstore/UserPreference;->setResult(I)V

    .line 80
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/UserPreference;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .end local v1           #privateKey:[B
    .end local v2           #sshKey:Ljava/io/InputStream;
    :cond_0
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    const/high16 v0, 0x7f05

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/UserPreference;->addPreferencesFromResource(I)V

    .line 31
    const-string v0, "openpgp_key_id"

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/UserPreference;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 32
    const-string v0, "ssh_key"

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/UserPreference;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 34
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/UserPreference;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 35
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 43
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 44
    .local v0, id:I
    packed-switch v0, :pswitch_data_0

    .line 50
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 46
    :pswitch_0
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Lcom/zeapo/pwdstore/UserPreference;->setResult(I)V

    .line 47
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/UserPreference;->finish()V

    .line 48
    const/4 v1, 0x1

    goto :goto_0

    .line 44
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 4
    .parameter "pref"

    .prologue
    const/4 v3, 0x1

    .line 55
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "openpgp_key_id"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 57
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "Operation"

    const-string v2, "GET_KEY_ID"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zeapo/pwdstore/UserPreference;->startActivityForResult(Landroid/content/Intent;I)V

    .line 64
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return v3

    .line 59
    :cond_1
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ssh_key"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 61
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    invoke-virtual {p0, v0, v3}, Lcom/zeapo/pwdstore/UserPreference;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method
