package com.bumptech.glide.load.a;

import android.content.ContentResolver;
import android.content.UriMatcher;
import android.net.Uri;
import android.provider.ContactsContract.Contacts;
import android.support.annotation.NonNull;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: StreamLocalUriFetcher */
public class n extends l<InputStream> {
    private static final int eg = 1;
    private static final int eh = 2;
    private static final int ei = 3;
    private static final int ej = 4;
    private static final int ek = 5;
    private static final UriMatcher el = new UriMatcher(-1);

    static {
        el.addURI("com.android.contacts", "contacts/lookup/*/#", 1);
        el.addURI("com.android.contacts", "contacts/lookup/*", 1);
        el.addURI("com.android.contacts", "contacts/#/photo", 2);
        el.addURI("com.android.contacts", "contacts/#", 3);
        el.addURI("com.android.contacts", "contacts/#/display_photo", 4);
        el.addURI("com.android.contacts", "phone_lookup/*", 5);
    }

    public n(ContentResolver contentResolver, Uri uri) {
        super(contentResolver, uri);
    }

    private InputStream e(Uri uri, ContentResolver contentResolver) throws FileNotFoundException {
        int match = el.match(uri);
        if (match != 1) {
            if (match == 3) {
                return openContactPhotoInputStream(contentResolver, uri);
            }
            if (match != 5) {
                return contentResolver.openInputStream(uri);
            }
        }
        Uri lookupContact = Contacts.lookupContact(contentResolver, uri);
        if (lookupContact != null) {
            return openContactPhotoInputStream(contentResolver, lookupContact);
        }
        throw new FileNotFoundException("Contact cannot be found");
    }

    private InputStream openContactPhotoInputStream(ContentResolver contentResolver, Uri uri) {
        return Contacts.openContactPhotoInputStream(contentResolver, uri, true);
    }

    @NonNull
    public Class<InputStream> aj() {
        return InputStream.class;
    }

    /* access modifiers changed from: protected */
    /* renamed from: d */
    public InputStream b(Uri uri, ContentResolver contentResolver) throws FileNotFoundException {
        InputStream e = e(uri, contentResolver);
        if (e != null) {
            return e;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("InputStream is null for ");
        sb.append(uri);
        throw new FileNotFoundException(sb.toString());
    }

    /* access modifiers changed from: protected */
    /* renamed from: d */
    public void j(InputStream inputStream) throws IOException {
        inputStream.close();
    }
}
